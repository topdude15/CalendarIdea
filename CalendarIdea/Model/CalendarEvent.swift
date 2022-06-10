import Foundation


let json = """

"""
struct CalendarEvents: Decodable, Encodable {
    var events: [Event]
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.events, forKey: .events)
    }
}
struct Event: Decodable, Identifiable, Encodable {
    let id: String
    let title: String
    let description: String
    let latitude: Double
    let longitude: Double
    let timestamp: Double
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.timestamp, forKey: .timestamp)
    }
}

func getCalendarEvents(fileName: String) -> CalendarEvents {
    
    do {
        let path = try FileManager.default
               .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               .appendingPathComponent("events.json")
        print(path)
        let data = try Data(contentsOf: path, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let calendarData = try decoder.decode(CalendarEvents.self, from: data)
        let sortedEvents = CalendarEvents(events: calendarData.events.sorted(by: {$0.timestamp > $1.timestamp}))
        return sortedEvents
    } catch {
        print(error)
    }
    
    return CalendarEvents(events: [])
}

func getSeparateCalendarEvents(fileName: String) {
    do {
        let path = try FileManager.default
               .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               .appendingPathComponent("events.json")
        print(path)
        let data = try Data(contentsOf: path, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let calendarData = try decoder.decode(CalendarEvents.self, from: data)
        let sortedEvents = CalendarEvents(events: calendarData.events.sorted(by: {$0.timestamp > $1.timestamp}))
        
        let list = Dictionary(grouping: sortedEvents.events, by: {Calendar.current.startOfDay(for: Date(timeIntervalSince1970: $0.timestamp))})
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        let sortedArrayOfDicts = list
            .map{(($0.key), [$0.key:$0.value])}
            .sorted{$0.0 < $1.0}
            .map{$1}
        print(sortedArrayOfDicts)
        // return sortedEvents
    } catch {
        print(error)
    }
    
    // return CalendarEvents(events: [])
}
