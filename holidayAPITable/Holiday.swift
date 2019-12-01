//
//  Holiday.swift
//  holidayAPITable
//
//  Created by Rachel Saunders on 01/12/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import Foundation

//Look into API for key names
// Decodable decodes information from JSON/API
// String has to be same name as API e.g. ios

struct HolidayResponse:Decodable {
    var response:Holidays
}

struct Holidays:Decodable {
    var holidays:[HolidayDetail]
}

struct HolidayDetail:Decodable {
    var name:String
    var date:DateInfo
}

struct DateInfo:Decodable {
    var ios:String
}
