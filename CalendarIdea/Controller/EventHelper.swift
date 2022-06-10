//
//  EventHelper.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/10/22.
//

import Foundation


func getEventTime(timestamp: Double) -> String {
        let newDate = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: newDate)
}
