//
//  Analytics.swift
//  UnitTesting
//
//  Created by Yusef Naser on 06/10/2021.
//

class Analytics {
    static let shared = Analytics()
    func track(event: String) {
        print(">> " + event)
        if self !== Analytics.shared {
            print(">> ...Not the Analytics singleton")
        }
    }
}
