//
//  ViewController.swift
//  WhetherData
//
//  Created by Arvind Joshi on 29/06/2018.
//  Copyright © 2018 Arvind Joshi. All rights reserved.
//

import UIKit
import SwiftCSVExport

//weak var progressView: UIProgressView!

class ViewController: UIViewController {

    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    @IBAction func downloadUKTemp(_ sender: Any) {
        
        let queue = OperationQueue()
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        
        for tempRegion in kAryRegion{
            
            if let url = NSURL(string: tempRegion["URL"]!) {
                
                let str = tempRegion["Region"]! + "_" + tempRegion["WhetherParam"]! + ".txt"
                
                if let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first {
                    let path = paths.appending("/\(str)")
                   // if !FileManager.default.fileExists(atPath: path) {
                        print(path)
                        var defaultFileName = ""
                        let documentsDirectoryURL = NSURL.fileURL(withPath: path)
                        if(tempRegion["Region"] == kRegionCode.UK.rawValue){
                            defaultFileName = "UK.txt"
                        }else if(tempRegion["Region"] == kRegionCode.England.rawValue){
                            defaultFileName = "England.txt"
                        }else if(tempRegion["Region"] == kRegionCode.Wales.rawValue){
                            defaultFileName = "Wales.txt"
                        }else if(tempRegion["Region"] == kRegionCode.Scotland.rawValue){
                            defaultFileName = "Scotland.txt"
                        }
                        let operation = BlockOperation { () -> Void in
                            print("starting download")
                            
                            Downloader().download(downloadUrl: String(tempRegion["URL"]!), saveUrl: str, completion: { results in
                                print("Success post title:")
                            })
                        }
                        queue.addOperation(operation)
                }
            }
        }
    }
    
    func saveImageInDocDirectory(data: Data?, fileName: String?, successblock: @escaping (_ path: String?) -> Void) { // To add the image to cache for given identifier.
        
        let paths = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true)[0] as String
        let path = paths.appending("/\(fileName!)")
        if !FileManager.default.fileExists(atPath: path) {
            do {
                
                try FileManager.default.createDirectory(at: URL(fileURLWithPath: path), withIntermediateDirectories: false, attributes: nil)
            } catch {
                print("Error creating images folder in Cache dir: \(error)")
            }
        }
    }
    
    
    @IBAction func ReadUKTemp(_ sender: Any) {
        
        var fileURL : URL = URL(string:  "http://google.com")!
     
        
        if let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first {
            var dataArray : NSMutableArray = NSMutableArray()
            for tempRegion in kAryRegion{
                let str = tempRegion["Region"]! + "_" + tempRegion["WhetherParam"]! + ".txt"
                fileURL = URL(fileURLWithPath: path + "/" +  str, isDirectory: false)
                var rawDataString: String
                var errorString: String?
                
                do {
                   // var dataArray : [NSMutableDictionary] = [NSMutableDictionary]()
                    
                    rawDataString = try String( contentsOf: fileURL, encoding: .utf8 )
                    var rawrows : [String] = rawDataString.components(separatedBy: "\n")
                    //Removing Initial rows
                    for tempRow in rawrows{
                        rawrows.removeFirst()
                        if tempRow == "\r"{
                            break
                        }
                    }
                    var i = 0
                    var aryKey : [String] = [String]()
                    //Split each row in columns
                    for tempRow in rawrows{
                        
                        
                        let rawColumn : [String] = tempRow.components(separatedBy: "    ")
                        
                        var j = 0
                        for tempKeyValue in rawColumn{
                            
                            var rawValues : [String] = tempKeyValue.components(separatedBy: "  ")
                            if(rawValues[0] == ""){
                                continue
                            }
                            let dataDict =  NSMutableDictionary()
                            if(i == 0){
                                aryKey.append(rawValues[0])
                            }else{
                                dataDict.setValue(tempRegion["Region"]! , forKey: "region_code")
                                dataDict.setValue(tempRegion["WhetherParam"]! , forKey: "weather_param")
                                dataDict.setValue(rawValues[0], forKey: "value")
                                dataDict.setValue(rawValues[1], forKey: "year")
                                dataDict.setValue(aryKey[j], forKey: "key")
                                //dataArray.append(dataDict)
                                dataArray.add(dataDict)
                                j = j + 1
                            }
                            
                        }
                        i = i + 1
                    }
                    
                    print("File Text: \(dataArray)")
                   
                } catch let error as NSError {
                    errorString = error.description
                    rawDataString = ""
                    print("File Error: \(String(describing: errorString))")
                    return
                }
            }
            
             self.generateCSV(dataArray: dataArray)
        }
    }
    
    func generateCSV(dataArray : NSMutableArray) {
        
        let header = ["region_code", "weather_param", "year", "key", "value"]
        let writeCSVObj = CSV()
        writeCSVObj.rows = dataArray
        writeCSVObj.delimiter = DividerType.comma.rawValue
        writeCSVObj.fields = header as NSArray
        writeCSVObj.name = "weather"

        let result : CSVResult = CSVExport.export(writeCSVObj);
      
   }
    
}

