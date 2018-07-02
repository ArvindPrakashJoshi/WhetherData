//
//  Constant.swift
//  WhetherData
//
//  Created by Arvind Joshi on 01/07/2018.
//  Copyright © 2018 Arvind Joshi. All rights reserved.
//

import Foundation

let kUK_Max_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/ranked/UK.txt"
let kUK_Min_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/ranked/UK.txt"
let kUK_Mean_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/ranked/UK.txt"
let kUK_Sunshine_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/ranked/UK.txt"
let kUK_Rainfall_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/ranked/UK.txt"

let kENG_Max_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/ranked/England.txt"
let kENG_Min_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/ranked/England.txt"
let kENG_Mean_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/ranked/England.txt"
let kENG_Sunshine_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/ranked/England.txt"
let kENG_Rainfall_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/ranked/England.txt"

let kWales_Max_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/ranked/Wales.txt"
let kWales_Min_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/ranked/Wales.txt"
let kWales_Mean_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/ranked/Wales.txt"
let kWales_Sunshine_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/ranked/Wales.txt"
let kWales_Rainfall_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/ranked/Wales.txt"

let kScotland_Max_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/ranked/Scotland.txt"
let kScotland_Min_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/ranked/Scotland.txt"
let kScotland_Mean_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/ranked/Scotland.txt"
let kScotland_Sunshine_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/ranked/Scotland.txt"
let kScotland_Rainfall_Temp = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/ranked/Scotland.txt"

enum kRegionCode: String {
    case UK = "UK"
    case England = "England"
    case Wales = "Wales"
    case Scotland = "Scotland"
}

enum kWhetherParam : String{
    case Max = "MaxTemp"
    case Min = "MinTemp"
    case Mean = "MeanTemp"
    case Sunshine = "Sunshine"
    case Rainfall = "Rainfall"
}

let kAryRegion = [
    ["Region": kRegionCode.UK.rawValue, "WhetherParam": kWhetherParam.Max.rawValue, "URL": kUK_Max_Temp ],
    ["Region": kRegionCode.UK.rawValue, "WhetherParam": kWhetherParam.Min.rawValue, "URL": kUK_Min_Temp ],
    ["Region": kRegionCode.UK.rawValue, "WhetherParam": kWhetherParam.Mean.rawValue, "URL": kUK_Mean_Temp ],
    ["Region": kRegionCode.UK.rawValue, "WhetherParam": kWhetherParam.Sunshine.rawValue, "URL": kUK_Sunshine_Temp ],
    ["Region": kRegionCode.UK.rawValue, "WhetherParam": kWhetherParam.Rainfall.rawValue, "URL": kUK_Rainfall_Temp ],
    ["Region": kRegionCode.England.rawValue, "WhetherParam": kWhetherParam.Max.rawValue, "URL": kENG_Max_Temp ],
    ["Region": kRegionCode.England.rawValue, "WhetherParam": kWhetherParam.Min.rawValue, "URL": kENG_Min_Temp ],
    ["Region": kRegionCode.England.rawValue, "WhetherParam": kWhetherParam.Mean.rawValue, "URL": kENG_Mean_Temp ],
    ["Region": kRegionCode.England.rawValue, "WhetherParam": kWhetherParam.Sunshine.rawValue, "URL": kENG_Sunshine_Temp ],
    ["Region": kRegionCode.England.rawValue, "WhetherParam": kWhetherParam.Rainfall.rawValue, "URL": kENG_Rainfall_Temp ],
    ["Region": kRegionCode.Wales.rawValue, "WhetherParam": kWhetherParam.Max.rawValue, "URL": kWales_Max_Temp ],
    ["Region": kRegionCode.Wales.rawValue, "WhetherParam": kWhetherParam.Min.rawValue, "URL": kWales_Min_Temp ],
    ["Region": kRegionCode.Wales.rawValue, "WhetherParam": kWhetherParam.Mean.rawValue, "URL": kWales_Mean_Temp ],
    ["Region": kRegionCode.Wales.rawValue, "WhetherParam": kWhetherParam.Sunshine.rawValue, "URL": kWales_Sunshine_Temp ],
    ["Region": kRegionCode.Wales.rawValue, "WhetherParam": kWhetherParam.Rainfall.rawValue, "URL": kWales_Rainfall_Temp ],
    ["Region": kRegionCode.Scotland.rawValue, "WhetherParam": kWhetherParam.Max.rawValue, "URL": kScotland_Max_Temp ],
    ["Region": kRegionCode.Scotland.rawValue, "WhetherParam": kWhetherParam.Min.rawValue, "URL": kScotland_Min_Temp ],
    ["Region": kRegionCode.Scotland.rawValue, "WhetherParam": kWhetherParam.Mean.rawValue, "URL": kScotland_Mean_Temp ],
    ["Region": kRegionCode.Scotland.rawValue, "WhetherParam": kWhetherParam.Sunshine.rawValue, "URL": kScotland_Sunshine_Temp ],
    ["Region": kRegionCode.Scotland.rawValue, "WhetherParam": kWhetherParam.Rainfall.rawValue, "URL": kScotland_Rainfall_Temp ]
]
