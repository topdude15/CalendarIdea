//
//  AddCalendarEventView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/8/22.
//

import SwiftUI
import MapKit

struct AddCalendarEventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var eventTitle: String
    @State var eventDescription: String = "Event description..."
    @State var eventDate: Date

    var body: some View {
        VStack {
            Form {
                TextField("Event Title", text: $eventTitle)
                TextField("Event Description", text: $eventDescription)
                DatePicker("Event Date and Time", selection: $eventDate)
                Button {
                    addEvent(eventTitle: eventTitle, eventDescription: eventDescription)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add event")
                }
            }
        }
    }
}

struct AddCalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddCalendarEventView(eventTitle: "", eventDescription: "", eventDate: Date.now)
    }
}
