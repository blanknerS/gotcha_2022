//
//  BackendAll.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/25/22.
//

import Foundation
import SwiftUI
import FirebaseCore
import Firebase

func loadUser(){ //pass uid later
    let db = Firestore.firestore()
    @State var data: String
    
    let uid = "Andrew_Rodriguez23@milton.edu" //this will be user we get.
    
    let docRef = db.document("data/" + uid)
    
    
    //read the document and get a 'snapshot' of its current data , if it fails return
    docRef.getDocument {snapshot, error in

        guard let data = snapshot?.data(), error == nil else{
            return
        }
        
        print(type(of: data))
        
//        return(data)
    }
}


