//
//  CustomLoginViewController.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/23/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuthUI
import FirebaseGoogleAuthUI

struct CustomLoginViewController : UIViewControllerRepresentable {

    var dismiss : (_ error : Error? ) -> Void

    func makeCoordinator() -> CustomLoginViewController.Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController
    {
        let authUI = FUIAuth.defaultAuthUI()

        let providers : [FUIAuthProvider] = [
            FUIGoogleAuth()
        ]

        authUI?.providers = providers
        authUI?.delegate = context.coordinator

        let authViewController = authUI?.authViewController()

        return authViewController!
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomLoginViewController>)
    {

    }

    //coordinator
    class Coordinator : NSObject, FUIAuthDelegate {
        var parent : CustomLoginViewController

        init(_ customLoginViewController : CustomLoginViewController) {
            self.parent = customLoginViewController
        }

        // MARK: FUIAuthDelegate
        func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?)
        {
            if let error = error {
                parent.dismiss(error)
            }
            else {
                parent.dismiss(nil)
            }
        }

        func authUI(_ authUI: FUIAuth, didFinish operation: FUIAccountSettingsOperationType, error: Error?)
        {
        }
    }
}
