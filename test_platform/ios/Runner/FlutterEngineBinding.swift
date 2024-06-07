//
//  FlutterEngineBinding.swift
//  pluto
//
//  Created by Mccc on 2022/1/6.
//  Copyright © 2022 bertadata. All rights reserved.
//

import Flutter
import Foundation

class FlutterEngineBinding: NSObject {
    // Engine
    public var engine = FlutterEngine()
    

    public var channel:FlutterMethodChannel?
    
    
    public required init(showModel: String) {
        var jsonString = ""
        if let jsonData = try? JSONSerialization.data(withJSONObject: ["showModel":showModel], options: []) {
            // 尝试将JSON数据转换为字符串
            if let innerJsonString = String(data: jsonData, encoding: .utf8) {
                jsonString = innerJsonString
            }
        }
        // engine group
        let groupOptions = FlutterEngineGroupOptions()
        groupOptions.entrypoint = entrypoint
        groupOptions.entrypointArgs = [jsonString]
        groupOptions.libraryURI = nil
        engine = FlutterContainerManager.shared.group.makeEngine(with: groupOptions)
        
        //signle engine no crash
//        engine.run(withEntrypoint: entrypoint, libraryURI: nil, initialRoute: nil, entrypointArgs: [jsonString])
        
        super.init()
        GeneratedPluginRegistrant.register(with: engine)
        
 
//        channel = FlutterMethodChannel(name: channelName,
//                                       binaryMessenger: engine.binaryMessenger)
        
       
        let factory = FlutterNativeViewFactory(messenger: engine.binaryMessenger)
        engine.registrar(forPlugin: "plugin_name1")!.register(factory, withId: "platform-view-type1")
    }
    
    private let entrypoint: String = "main"
    private let channelName: String = "flutter_channel_1"
}


extension FlutterEngineBinding {
    public func attach(container: FlutterContainerViewController) {
       
//        channel?.setMethodCallHandler { [weak self, weak container] (call: FlutterMethodCall, result: @escaping FlutterResult) in
//            
//            
//        }
    }
    
}
