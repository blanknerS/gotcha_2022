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
        do {
            let pulled_sayings = try RemoteConfig.remoteConfig().configValue(forKey: "profile_sayings").jsonValue as! Array<String>
            return pulled_sayings.randomElement()!
        }
        catch{
            return "Not working right now"
        }
    }()
}

