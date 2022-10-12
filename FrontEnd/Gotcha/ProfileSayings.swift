//
//  ProfileSayings.swift
//  Gotcha
//
//  Created by Blake Ankner on 10/11/22.
//

import Foundation
import Firebase


public struct ProfileSayings {
    
    
    static let saying: String = {
        let pulled_sayings = RemoteConfig.remoteConfig().configValue(forKey: "profile_sayings").jsonValue as! Array<String>
        return pulled_sayings.randomElement()!
    }()
}

