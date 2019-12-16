//
//  HolidayRequest.swift
//  holidayAPITable
//
//  Created by Rachel Saunders on 01/12/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import Foundation

enum HolidayError:Error {
    case noDataAvailable
    case cannotProcessData
}

struct HolidayRequest {
    let resourceURL:URL
    let API_KEY = "43f3d4d51a636efa9fa986daca5973a36cc6fc07"
    
    
    init(countryCode:String) {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
        
    }
    
    func getHolidays (completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let holidayResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidayResponse.response.holidays
                completion(.success(holidayDetails))
            }catch{
                completion(.failure(.cannotProcessData))
            }
            
        }
        dataTask.resume()
    }
    
}
