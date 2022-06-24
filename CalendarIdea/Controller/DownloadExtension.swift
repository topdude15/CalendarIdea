//
//  DownloadExtension.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/17/22.
//

import Foundation

extension URLSession {
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async throws  -> T {
        let (data, _) = try await data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy

        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}

func testDownload() {
    print("Made it")
    URLSession.shared.dataTask(with: URL(string: "http://calendartestingapp.infinityfreeapp.com/events.json")!) { (data, response, error) -> Void in
        // Check if data was received successfully
        print("here now lol gottem")
        if error == nil && data != nil {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .secondsSince1970
                let calendarData = try decoder.decode(Schedule.self, from: data!)
                let sortedEvents = Schedule(events: calendarData.events.sorted(by: {$0.timestamp > $1.timestamp}))
                print(sortedEvents)
                // Access specific key with value of type String
            } catch {
                let outputStr = String(data: data!, encoding: String.Encoding.utf8) as String?
                print(outputStr!)
                print(error)
            }
        }
    }.resume()
}
