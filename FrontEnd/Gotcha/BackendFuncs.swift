//
//  BackendFuncs.swift
//  Gotcha
//
//  Created by Andrew Rodriguez 5/26/22.

import Foundation
import FirebaseFirestore

extension Date {
    func dayNumberOfWeek() -> String? {
        return String(Calendar.current.dateComponents([.weekday], from: self).weekday!)
    }
}

func inDB(uid: String) async -> Bool{
    let db = Firestore.firestore()
    let docRef = db.document("data/" + uid)
    var name: String = ""
    
    do{
        let data = try await docRef.getDocument()
        let collectedName = data.get("firstName")
        
        if collectedName == nil{
            return false //theyre not
        }
        else{
            return true
        }
    }
    catch{
        print("WHELP")
    }
    return false
    //    if name != nil || name != ""{
    //        print("\(uid) is CLEAR")
    //        return true
    //    }
    //    else{
    //        print("\(uid) is BAD")
    //        return false
}

//Needs to be async and have the proper returns

func lifeStatus(uid: String) async -> Bool{
    let db = Firestore.firestore()
    let docRef = db.document("data/" + uid)
    var retVal = true as Bool
    
    do {
        let data = try await docRef.getDocument()
        
        let life = data.get("alive") as? Bool
        
        retVal = life!
        
    }catch{
        print("err")
    }
    
    return retVal
}

func lWStatus(uid: String) async -> String{
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
        let lW = data.get("lastWords") as? String
        
        //unwrap the name and save it to our return var
        retVal = lW!
    }catch{//if that doesnt work its an error
        print("err")
    }
    //return the return var
    return(retVal)
}



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

func updateStat(id: String) {
    
    let db = Firestore.firestore()
    
    let stat = id
    
    let docRef = db.document("stats/" + stat)
    
    docRef.getDocument {snapshot, error in
        
        guard let data = snapshot?.data(), error == nil else{
            return
        }
        //save their target and chaser as targ and chase
        guard let total = data["total"] as? Int else{
            return
        }
        
        docRef.updateData(["total": total+1
                          ])
        
    }
}

func readStats (id: String) async -> Int{
    let db = Firestore.firestore()
    
    let stat = id
    
    let docRef = db.document("stats/" + stat)
    
    var retVal = 0 as Int
    
    do{
        let data = try await docRef.getDocument()
        
        let total = data.get("total") as? Int
        
        retVal = total!
    }catch{
        print("err")
    }
    return(retVal)
    
}


func tagOut(uid: String, lW: String, name: String,TimeStanp: Date){
    //Reference to a specific firebase document within the collection users
    let db = Firestore.firestore()
    let docRef = db.document("data/" + uid)
    
    //okay so just read the UID data
    docRef.getDocument {snapshot, error in

        guard let data = snapshot?.data(), error == nil else{
            return
        }
        //save their target and chaser as targ and chase
        guard let targ = data["target"] as? String else{
            return
        }
        guard let chase = data["chaser"] as? String else{
            return
        }
        


        
        
        //go in a read their chasers tags and increase it by one tag
        let docRef = db.document("data/" + chase)
        
        docRef.getDocument {snapshot, error in
    

            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let tags = data["tags"] as? Int else{
                return
            }
            
            guard let clss = data["class"] as? String else{
                return
            }
            
    
            updateData(uid: chase, field: "tags", data: tags+1)
            
            
            if clss == "senior"{
                updateStat(id: "I_Tags")
            }
            if clss == "junior"{
                updateStat(id: "II_Tags")
            }
            if clss == "sophomore"{
                updateStat(id: "III_Tags")
            }
            if clss == "freshman"{
                updateStat(id: "IV_Tags")
            }
            
            
            guard let d_b = data["d/b"] as? String else{
                return
            }
        
            let day = (Date().dayNumberOfWeek()!)
            
            updateStat(id: d_b+day)
            updateStat(id: "total"+day)
            
            
            
            
        }
       
        //chase the chaser target and the targets chaser
        updateData(uid: chase, field: "target", data: targ)
        updateData(uid: targ, field: "chaser", data: chase)
        
        //update the uid's stuff
        updateData(uid: uid, field: "alive", data: false)
        updateData(uid: uid, field: "lastWords", data: lW )
        
        
        db.collection("lastWords").document(uid).setData([
            "Author": name,
             "Lw" : lW,
            "TimeStamp": TimeStanp,
        ])
    }
}
