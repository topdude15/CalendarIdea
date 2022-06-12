//
//  AccountView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/10/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            Text("Account Page")
            Button  {
                do {
                    let path = try FileManager.default
                           .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                           .appendingPathComponent("events.json")
                    if FileManager.default.fileExists(atPath: path.path) {
                        try FileManager.default.removeItem(at: path)
                        print("File removed")
                    } else {
                        print("File does not exist")
                    }
                } catch {
                    
                }
            } label: {
                Text("Delete Events File")
            }

        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
