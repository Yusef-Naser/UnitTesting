//
//  LifeCycle.swift
//  UnitTesting
//
//  Created by Yusef Naser on 07/09/2021.
//

class LifeCycle {
    
    static var allInstance = 0
    var instance : Int
    
    init() {
        LifeCycle.allInstance += 1
        self.instance = LifeCycle.allInstance
        print(">> LifeCycle.init() #\(instance)")
    }
    
    deinit {
        print(">> LifeCycle.deinit #\(instance)")
    }
    
    func methodOne () {
        print(">> method one")
    }
    func methodTwo () {
        print(">> method two")
    }
}
