//
//  main.swift
//  UnitTesting
//
//  Created by Yusef Naser on 09/09/2021.
//

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("AppDelegateTests") ?? AppDelegate.self
UIApplicationMain( CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
