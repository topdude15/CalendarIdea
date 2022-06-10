//
//  AddEvent.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/8/22.
//

import Foundation

func addEvent(eventTitle: String, eventDescription: String){
    var events = getCalendarEvents(fileName: "events")
    events.events.append(Event(id: UUID().uuidString, title: eventTitle, description: eventDescription, latitude: 123, longitude: 123, timestamp: NSDate().timeIntervalSince1970))
    
    do {
        let path = try FileManager.default
               .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               .appendingPathComponent("events.json")
        try JSONEncoder().encode(events).write(to: path)
    } catch {
        print(error)
    }
}
