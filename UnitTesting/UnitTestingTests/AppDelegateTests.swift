//
//  AppDelegateTests.swift
//  UnitTesting
//
//  Created by Yusef Naser on 09/09/2021.
//

import Foundation
import  UIKit

@objc(AppDelegateTests)
class AppDelegateTests: UIResponder, UIApplicationDelegate {
    func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("<< Launching with testing app delegate")
        return true
    }
}
