import UIKit
import Flutter
import Firebase
import GoogleMaps
import FBSDKCoreKit
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
 override func application(
   _ application: UIApplication,
   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
 ) -> Bool {
   // Initialize Google Maps SDK with your API key
   GMSServices.provideAPIKey("AIzaSyCbez_jA31a4_EeAxmbC_3kvIWdU8Ant34")
   // Initialize Firebase
   FirebaseApp.configure()
   // Initialize Facebook SDK
   ApplicationDelegate.shared.application(
     application,
     didFinishLaunchingWithOptions: launchOptions
   )
   // Register all generated plugins
   GeneratedPluginRegistrant.register(with: self)
   // Handle any additional setup or configurations here
   return super.application(application, didFinishLaunchingWithOptions: launchOptions)
 }
 // Handle Facebook authentication callback
 override func application(
   _ app: UIApplication,
   open url: URL,
   options: [UIApplication.OpenURLOptionsKey : Any] = [:]
 ) -> Bool {
   // Handle Facebook URL scheme
   if let scheme = url.scheme, scheme.hasPrefix("fb") {
     return ApplicationDelegate.shared.application(
       app,
       open: url,
       options: options
     )
   }
   // Handle other URL schemes or fallback to Flutter
   return super.application(app, open: url, options: options)
 }
}