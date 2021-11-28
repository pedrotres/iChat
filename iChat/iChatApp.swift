//
//  iChatApp.swift
//  iChat
//
//  Created by Pedro Francisco Tres on 27/11/21.
//

import SwiftUI
import Firebase

@main
struct iChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
