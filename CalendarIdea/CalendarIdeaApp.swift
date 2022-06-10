//
//  CalendarIdeaApp.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/6/22.
//

import SwiftUI

@main
struct CalendarIdeaApp: App {
    
    init() {
        do {
            let path = try FileManager.default
                   .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent("events.json")
            print(path)
            if FileManager.default.fileExists(atPath: path.path) {
                print("File exists")
            } else {
                print("File does not exist")
            }
        } catch {
            
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
