//
//  ContentView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            YourScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            YourSubscriptionView()
                .tabItem {
                    Label("Subscriptions", systemImage: "bell")
                }
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "text.viewfinder")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            AccountView()
                .tabItem {
                    Label("Settings", systemImage: "person")
                }
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
