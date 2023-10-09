//
//  BuildCnfig.swift
//  Gotcha
//
//  Created by Blake Ankner on 6/9/22.
//  Modifed by Ben Rhodes-Kropf on 10/8/23

import Foundation
import SwiftUI

struct BuildConfig {
    static var googleKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
                  let plist = NSDictionary(contentsOfFile: filePath),
                  let clientId = plist["CLIENT_ID"] as? String else {
                fatalError("Couldn't fetch Google key from GoogleService-Info.plist.")
            }
            return clientId
        }
    }
}
