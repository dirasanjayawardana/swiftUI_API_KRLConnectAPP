//
//  DateUtility.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation

struct DateUtility {
    static func formatDate(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        
        if let date = isoDateFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}
