import Flutter
import UIKit
import Foundation

public class FlutterNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterJSONMessageCodec()
    }
    
    
    
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FlutterNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

public class FlutterNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        _view.backgroundColor = UIColor.white
        
        let btn =  UIButton();
        btn.backgroundColor = .green;
        btn.setTitle("model_2", for: UIControl.State.normal);
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100);
        
        btn.addTarget(self, action: #selector(model_2), for: .touchUpInside)
        _view.addSubview(btn)
        
        
    }
    
    
    @objc func model_2(){
        
        if let nav = (UIApplication.shared.delegate?.window as? UIWindow)?.rootViewController as? UINavigationController{
            let vc = FlutterContainerViewController(showModel: "2")
            vc.title = "page_\(nav.viewControllers.count+1)_model2"
            nav.pushViewController(vc, animated: true)
        }
        
    }
    
    public func view() -> UIView {
        return _view
    }
    
    
    
}

