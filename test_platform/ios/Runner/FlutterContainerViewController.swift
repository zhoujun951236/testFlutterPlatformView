//
//  FlutterContainerViewController.swift
//  pluto
//
//  Created by Mccc on 2022/1/6.
//  Copyright © 2022 bertadata. All rights reserved.
//

import Flutter
import Foundation


public class FlutterContainerViewController: FlutterViewController {
  
    
    private var route: String = ""
    
    public required init(showModel: String) {
        
        engineBinding = FlutterEngineBinding(showModel: showModel)
        
      
        let engine = engineBinding.engine
        
        
        super.init(engine: engine, nibName: nil, bundle: nil)
        
     
//        engineBinding.attach(container: self)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil

        
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
      
    }

    private(set) var engineBinding: FlutterEngineBinding

    
    deinit {
        
    }
    
   
}


