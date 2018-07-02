//
//  Downloader.swift
//  WhetherData
//
//  Created by Arvind Joshi on 29/06/2018.
//  Copyright © 2018 Arvind Joshi. All rights reserved.
//

import Foundation
import Alamofire

class Downloader   {
        
        var url : URL?
        // will be used to do whatever is needed once download is complete
        var yourOwnObject : NSObject?
    
   
    
    func download(downloadUrl:String, saveUrl:String, completion: ((Bool) -> Void)?) {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let file = directoryURL.appendingPathComponent(saveUrl, isDirectory: false)
            return (file, [.createIntermediateDirectories, .removePreviousFile])
        }
        Alamofire.download(downloadUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination).responseJSON { response in
            if response.result.error == nil {
                completion?(true)
            } else {
                print(#function, "error")
            }
        }
    }

//        init(_ yourOwnObject : NSObject)
//        {
//            self.yourOwnObject = yourOwnObject
//        }
//
//        //is called once the download is complete
//        func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL)
//        {
//            //copy downloaded data to your documents directory with same names as source file
//            let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//            let destinationUrl = documentsUrl!.appendingPathComponent(url!.lastPathComponent)
//            let dataFromURL = NSData(contentsOf: location)
//            dataFromURL?.write(to: destinationUrl, atomically: true)
//
//            //now it is time to do what is needed to be done after the download
//           // yourOwnObject!.callWhatIsNeeded()
//        }
//
//        //this is to track progress
//        private func URLSession(session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
//        {
//        }
//
//        // if there is an error during download this will be called
//        func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
//        {
//            if(error != nil)
//            {
//                //handle the error
//                print("Download completed with error: \(error!.localizedDescription)");
//            }
//        }
//
//        //method to be called to download
//    func download(url: URL , defaultFileName: String , fileName: String)
//        {
//
//            self.url = url
//
//            //download identifier can be customized. I used the "ulr.absoluteString"
//            let sessionConfig = URLSessionConfiguration.background(withIdentifier: url.absoluteString)
//            let session = Foundation.URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
//
//            let task = session.downloadTask(with: url)
//            do {
//                let suggestedName : String = (task.response?.suggestedFilename != nil) ? (task.response?.suggestedFilename)! : " "
//                let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//                let documentDirectory = URL(fileURLWithPath: path)
//                let originPath = documentDirectory.appendingPathComponent(defaultFileName)
//                let destinationPath = documentDirectory.appendingPathComponent(fileName)
//                try FileManager.default.moveItem(at:originPath, to: destinationPath)
//            } catch {
//                print(error)
//            }
//            task.resume()
//        }
// /*
//    func downloaderAlamofire(fileUrl : String, destination : String)  {
//
//        Alamofire.download(<#T##urlRequest: URLRequestConvertible##URLRequestConvertible#>, to: <#T##DownloadRequest.DownloadFileDestination?##DownloadRequest.DownloadFileDestination?##(URL, HTTPURLResponse) -> (destinationURL: URL, options: DownloadRequest.DownloadOptions)#>)
//
//
//        //Alamofire.download(fileUrl, to: destination)
//            .downloadProgress { progress in
//                print("Download Progress:---------- \(progress.fractionCompleted)")
//
//            }
//            .responseData { response in
//
//                print(response.request)
//                print(response.response)
//                print(response.temporaryURL)
//                print(response.destinationURL)
//                print(response.error)
//
//
//        }
//    }*/
}
