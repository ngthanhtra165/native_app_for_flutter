
import UIKit
import Flutter

@main
class AppDelegate: FlutterAppDelegate {
    lazy var flutterEngineHomeScreen = FlutterEngine(name: "flutterEngineHomeScreen")
    lazy var flutterEngineDetailScreen = FlutterEngine(name: "flutterEngineDetailScreen")
    lazy var flutterEngineLoginScreen = FlutterEngine(name: "flutterEngineLoginScreen")
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        flutterEngineHomeScreen.run()        // pre warm engine
        //flutterEngineFullScreen.run();
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    override func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    override func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
