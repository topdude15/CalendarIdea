//
//  CalendarEventView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/6/22.
//

import SwiftUI

struct CalendarEventView: View {
    
    var title: String
    var description: String
    var timestamp: Double
    
    var eventTime: String {
        get {
            getEventTime(timestamp: timestamp)
        }
    }

    var body: some View {
        HStack {
            Image(systemName: "archivebox.fill")
                .padding()
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                    Spacer()
                    Text(eventTime)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Text(description)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView(title: "Open Volleyball", description: "Come join us for open volleyball!", timestamp: 12341234)
    }
}
