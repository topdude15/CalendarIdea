//
//  EventHelper.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/10/22.
//

import Foundation


func getEventTime(timestamp: Double) -> String {
        // getEventTime converts the timestamp of an event into a 12hr time with the local time zone
        let newDate = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: newDate)
}

func getEventDate(eventDate: Date) -> String {
    // getEventDate takes a date and formats it to return the string value of the name with month and day ex. "Friday, June 10"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM dd"
    return dateFormatter.string(from: eventDate)
}

func getSeparateCalendarEvents(fileName: String) -> [Day] {
    do {
        // Get path of local events.json file
        let path = try FileManager.default
               .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               .appendingPathComponent("events.json")
        let data = try Data(contentsOf: path, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        // Decode events.json into Schedule
        let calendarData = try decoder.decode(Schedule.self, from: data)
        // Sort the events based on timestamp
        let sortedEvents = Schedule(events: calendarData.events.sorted(by: {$0.timestamp > $1.timestamp}))
        // Create a dictionary of the events based on timestamp
        // Uses startOfDay to group events with timestamps that equate to the same day
        let list = Dictionary(grouping: sortedEvents.events, by: {Calendar.current.startOfDay(for: Date(timeIntervalSince1970: $0.timestamp))})
        // Sort the dictionary events based on date, which is the key
        let sortedArrayOfDicts = list
            .map{(($0.key), [$0.key:$0.value])}
            .sorted{$0.0 < $1.0}
            .map{$1}
        
        // We can use an array of Day structs to keep each set of events organized by day
        var days: [Day] = []
        
        
        for day in sortedArrayOfDicts {
            for events in day.values {
                days.append(Day(id: Array(day.keys)[0], events: events))
            }
        }
        return days
    } catch {
        print(error)
    }
    
    return [Day(id: Date.now, events: [])]
}

func getCalendarEvents(fileName: String) -> Schedule {
    do {
        let path = try FileManager.default
               .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               .appendingPathComponent("events.json")
        print(path)
        let data = try Data(contentsOf: path, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let calendarData = try decoder.decode(Schedule.self, from: data)
        let sortedEvents = Schedule(events: calendarData.events.sorted(by: {$0.timestamp > $1.timestamp}))
        return sortedEvents
    } catch {
        print(error)
    }
    
    return Schedule(events: [])
}
