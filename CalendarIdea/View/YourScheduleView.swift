//
//  YourScheduleView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/8/22.
//

import SwiftUI

struct YourScheduleView: View {
    
    @State var days = getSeparateCalendarEvents(fileName: "events")
    
    @State var refresh: Bool = true
    
    @State private var showingPopover = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(days) { day in
                        Section(header: Text(getEventDate(eventDate:day.id))) {
                            ForEach(day.events) { event in
                                NavigationLink {
                                    CalendarDetailView(event: event)
                                } label: {
                                    CalendarEventView(title: event.title, description: event.description, timestamp: event.timestamp)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Your Schedule")
            .toolbar {
                Button {
                    showingPopover = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingPopover, onDismiss: {
                    days = getSeparateCalendarEvents(fileName: "events")
                }, content: {
                    AddCalendarEventView(eventTitle: "", eventDescription: "", eventDate: Date.now)
                })
            }
        }
    }
}

struct YourScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        YourScheduleView()
    }
}
