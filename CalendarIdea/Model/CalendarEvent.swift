import Foundation


struct Day: Identifiable {
    var id: Date
    var events: [Event]
}

struct Schedule: Decodable, Encodable {
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
