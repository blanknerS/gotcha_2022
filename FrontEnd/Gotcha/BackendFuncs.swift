//
//  BackendFuncs.swift
//  Gotcha
//
//  Created by Andrew Rodriguez 5/26/22.
//

import Foundation
import FirebaseFirestore


//Needs to be async and have the proper returns
func firstName(uid: String) async -> String{
    //Init firebase db
    let db = Firestore.firestore()
    
    //init reference to the document for that user
    let docRef = db.document("data/" + uid)
    
    //make our returning variable
    var retVal = "" as String
    
    //Do this async-ly
    do{
        //try to get the document and save it to the data var
        let data = try await docRef.getDocument()
        
        //extract the name as a string from the document
        let name = data.get("firstName") as? String
        
        //unwrap the name and save it to our return var
        retVal = name!
    }catch{//if that doesnt work its an error
        print("err")
    }
    //return the return var
    return(retVal)
}

// THAT FORMAT IS FOLLOWED FOR ALL OTHER FUNCTIONS BELOW

//Function that returns tag count
func tags(uid: String) async -> Int{
    let db = Firestore.firestore()
    let docRef = db.document("data/" + uid)
    
    var retVal = 0 as Int
    
    do{
        let data = try await docRef.getDocument()
        let tags = data.get("tags") as? Int
        
        //unwrap the int a little differently
        if let tags = tags {
            retVal = tags + 0
        }
    }
    catch{
        print("err")
    }
    
    return(retVal)
}

func targ(uid: String) async -> String {
    let db = Firestore.firestore()
    let docRef = db.document("data/" + uid)
    
    var retVal = "" as String
    
    do{
        let data = try await docRef.getDocument()
        let targ = data.get("target") as? String
        
        retVal = targ!
    }
    
    catch{
        print("err")
    }
    
    return(retVal)
}

func fullName(uid: String) async -> String {
    let db = Firestore.firestore()
    let docRef = db.document("data/" + uid)
    
    var retVal = "" as String
    
    do{
        let data = try await docRef.getDocument()
        let fN = data.get("firstName") as? String
        let lN = data.get("lastName") as? String
        
        retVal = fN! + " " + lN!
    }
    
    catch{
        print("err")
    }
    
    return(retVal)
}









func updateData(uid: String, field: String, data: Any) {
    
    let db = Firestore.firestore()
    
    let user = uid
    
    let docRef = db.document("data/" + user)
    
    docRef.updateData([field: data
                   ])
    
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
