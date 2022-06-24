//
//  CalendarIdeaApp.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/6/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class AppDelegate: NSObject, UIApplicationDelegate, FUIAuthDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()


    return true
  }
}
@main
struct CalendarIdeaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
