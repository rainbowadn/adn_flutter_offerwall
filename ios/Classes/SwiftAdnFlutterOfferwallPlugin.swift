import Flutter
import UIKit
import BuzzvilSDK

public class SwiftAdnFlutterOfferwallPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "adn_flutter_offerwall", binaryMessenger: registrar.messenger())
        let instance = SwiftAdnFlutterOfferwallPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            initWithAppKey(call, result)
        case "setUserId":
            setUserId(call, result)
        case "setGender":
            setGender(call, result)
        case "setBirthYear":
            setBirthYear(call, result)
        case "showOfferWall":
            showOfferWall(call, result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func initWithAppKey(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        guard let argMaps = call.arguments as? Dictionary<String, Any>,
              let appKey = argMaps["appKey"] as? String else {
            result(FlutterError(code: call.method, message: "Missing argument: appKey", details: nil))
            return
        }
        
        BuzzvilCore.initWithAppKey(appKey)
    }
    
    private func setUserId(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        guard let argMaps = call.arguments as? Dictionary<String, Any>,
              let userId = argMaps["userId"] as? String else {
            result(FlutterError(code: call.method, message: "Missing argument: userId", details: nil))
            return
        }
        
        BuzzvilCore.setUserId(userId)
    }
    
    private func setGender(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        guard let argMaps = call.arguments as? Dictionary<String, Any>,
              let gender = argMaps["gender"] as? String else {
            result(FlutterError(code: call.method, message: "Missing argument: gender", details: nil))
            return
        }
        
        BuzzvilCore.setGender(gender)
    }
    
    private func setBirthYear(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        guard let argMaps = call.arguments as? Dictionary<String, Any>,
              let birthYear = argMaps["birthYear"] as? Int else {
            result(FlutterError(code: call.method, message: "Missing argument: birthYear", details: nil))
            return
        }
        
        BuzzvilCore.setBirthYear(birthYear)
    }
    
    private func showOfferWall(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        guard let argMaps = call.arguments as? Dictionary<String, Any>,
              let title = argMaps["title"] as? String else {
            result(FlutterError(code: call.method, message: "Missing argument: title", details: nil))
            return
        }
        
        result(BuzzOfferwall.showOfferWall(withTitle: title))
    }
}
