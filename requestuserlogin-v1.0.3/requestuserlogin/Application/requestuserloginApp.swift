//
//  requestuserloginApp.swift
//  requestuserlogin

import SwiftUI

@main
struct requestuserloginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
