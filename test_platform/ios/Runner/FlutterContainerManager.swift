//
//  FlutterContainerManager.swift
//  pluto
//
//  Created by Mccc on 2022/1/6.
//  Copyright © 2022 bertadata. All rights reserved.
//



import Flutter
import Foundation



@objc class FlutterContainerManager: NSObject {

    @objc public static let shared = FlutterContainerManager()
    @objc let group: FlutterEngineGroup = FlutterEngineGroup(name: "testGroup", project: nil);
        
    override private init() {
    }
}

