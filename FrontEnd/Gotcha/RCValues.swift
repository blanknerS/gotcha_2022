//
//  RCValues.swift
//  Gotcha
//
//  Created by Blake Ankner on 9/12/22.
//

import Firebase
import FirebaseRemoteConfig

class RCValues {
    static let sharedInstance = RCValues()
    
    private init() {
        fetchCloudValues()
        loadDefaultValues()
    }
    
    func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            "appPrimaryColor": "#FBB03B",
            "countdownDate": "2020-09-15T22:20",
            "gotchaStartDate": "2020-11-10T08:00",
        ]
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
        print("defaults loaded")
    }
    func activateDebugMode() {
        let settings = RemoteConfigSettings()
        // WARNING: Don't actually do this in production!
        settings.minimumFetchInterval = 0
        RemoteConfig.remoteConfig().configSettings = settings
    }
    func fetchCloudValues() {
        // 1
        activateDebugMode()
        
        // 2
        RemoteConfig.remoteConfig().fetch { [weak self] _, error in
            if let error = error {
                print("Uh-oh. Got an error fetching remote values \(error)")
                // In a real app, you would probably want to call the loading
                // done callback anyway, and just proceed with the default values.
                // I won't do that here, so we can call attention
                // to the fact that Remote Config isn't loading.
                return
            }
            
            // 3
            RemoteConfig.remoteConfig().activate { _, _ in
                print("Retrieved values from the cloud!")
                let appPrimaryColorString = RemoteConfig.remoteConfig()
                  .configValue(forKey: "appPrimaryColor")
                  .stringValue ?? "undefined"
                print("Our app's primary color is \(appPrimaryColorString)")
            }
        }
    }
}
