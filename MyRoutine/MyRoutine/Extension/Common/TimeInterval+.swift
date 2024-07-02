//
//  TimeInterval+.swift
//  MyRoutine
//
//  Created by 김태성 on 7/2/24.
//

import Foundation

extension TimeInterval {
    func getFormattedString(_ format: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}
