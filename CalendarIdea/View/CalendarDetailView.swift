//
//  CalendarDetailView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/7/22.
//

import SwiftUI

struct CalendarDetailView: View {
    
    let event: Event
    var date: String {
        get {
            let newDate = Date(timeIntervalSince1970: event.timestamp)
            let dateFormatter = DateFormatter()
            var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
            dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "MM-dd-yyyy hh:mm a"
            return dateFormatter.string(from: newDate)
        }
    }
    var body: some View {
        Text("This event is occuring at \(date)")
    }
}

struct CalendarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetailView(event: Event(id: "0", title: "Open Volleyball", description: "Come join us for open volleyball!", latitude: 123, longitude: 123, timestamp: 1654705096
))
    }
}
