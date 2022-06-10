//
//  YourScheduleView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/8/22.
//

import SwiftUI

struct YourScheduleView: View {
    
    @State var events = getCalendarEvents(fileName: "events")
    
    @State var refresh: Bool = true
    
    @State private var showingPopover = false
    
    var body: some View {
        NavigationView {
            VStack {
                let _ = print(events)
                if (events.events.count != 0) {
                    List(events.events) { event in
                        NavigationLink {
                            CalendarDetailView(event: event)
                        } label: {
                            CalendarEventView(title: event.title, description: event.description, timestamp: event.timestamp)
                        }
                    }
                    .navigationTitle("Your Schedule")
                    .toolbar {
                        Button {
                            showingPopover = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingPopover, onDismiss: {
                            events = getCalendarEvents(fileName: "events")
                        }, content: {
                            AddCalendarEventView(eventTitle: "", eventDescription: "", eventDate: Date.now)
                        })
                    }
                } else {
                    Text("This is not empty")
                        .navigationTitle("Nothing is here...")
                        .toolbar {
                            Button {
                                showingPopover = true
                            } label: {
                                Text("+")
                            }
                            .sheet(isPresented: $showingPopover, onDismiss: {
                                events = getCalendarEvents(fileName: "events")
                            }, content: {
                                AddCalendarEventView   (eventTitle: "", eventDescription: "", eventDate: Date.now)
                            })
                        }
                }
            }
        }
    }
}

struct YourScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        YourScheduleView()
    }
}
