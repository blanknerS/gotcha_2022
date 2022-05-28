//
//  BackendFuncs.swift
//  Gotcha
//
//  Created by Andrew Rodriguez 5/26/22.
//

import Foundation
import FirebaseFirestore

func initFirebase(){
    
    let db = Firestore.firestore()
    
    let docRef = db.document("data/Andrew_Rodriguez23@milton.edu")


    docRef.getDocument {snapshot, error in

        guard let data = snapshot?.data(), error == nil else{
            return
        }
        
        print(data)
        
    
    
    }
}

func updateData(uid: String, field: String, data: Any) {
    
    let db = Firestore.firestore()
    
    let user = uid
    
    let docRef = db.document("data/" + user)
    
    docRef.updateData([field: data
                   ])
    
}

func name(uid: String) -> String {
    let db = Firestore.firestore()
    
    let docRef = db.document("data/" + uid)
    
    //read the document and get a 'snapshot' of its current data , if it fails return
    docRef.getDocument {snapshot, error in

        guard let data = snapshot?.data(), error == nil else{
            return
        }
        
        print(data)
        
        guard let fN = data["firstName"] as? String else{
            return
        }
        
    }
    
    return("Andrew")
        

}


func tagOut(uid: String, lW: String){
    //Reference to a specific firebase document within the collection users
    let db = Firestore.firestore()
    
    let docRef = db.document("data/" + uid)
    
    //read the document and get a 'snapshot' of its current data , if it fails return
    docRef.getDocument {snapshot, error in

        guard let data = snapshot?.data(), error == nil else{
            return
        }
        
        print(data)
        
        guard let targ = data["target"] as? String else{
            return
        }
        guard let chase = data["chaser"] as? String else{
            return
        }
        guard let tags = data["tags"] as? Int else{
            return
        }
        guard let fN = data["firstName"] as? Bool else{
            return
        }
        guard let lastWords = data["lastWords"] as? String else{
            return
        }

        let personTaggingOut = uid
        
        updateData(uid: chase, field: "target", data: targ)
        updateData(uid: chase, field: "tags", data: tags+1)
        
        updateData(uid: targ, field: "chaser", data: chase)
        
        updateData(uid: personTaggingOut, field: "alive", data: false)
        updateData(uid: personTaggingOut, field: "lastWords", data: lW )
    
        
        
       
        
        
       
    
    }
    
    

    
}
