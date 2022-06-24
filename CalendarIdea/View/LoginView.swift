//
//  LoginView.swift
//  CalendarIdea
//
//  Created by Trevor Rose on 6/20/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuthUI
import FirebaseGoogleAuthUI

public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

struct LoginView : View {

    @State private var viewState = CGSize(width: 0, height: screenHeight)
    @State private var MainviewState = CGSize.zero

    var body : some View {
        ZStack {
            CustomLoginViewController { (error) in
                if error == nil {
                    self.status()
                }
            }.offset(y: self.MainviewState.height).animation(.spring())
        }
    }

    func status() {
        self.viewState = CGSize(width: 0, height: 0)
        self.MainviewState = CGSize(width: 0, height: screenHeight)
    }
}

struct LoginView_Previews : PreviewProvider {
    static var previews : some View {
        LoginView()
    }
}
