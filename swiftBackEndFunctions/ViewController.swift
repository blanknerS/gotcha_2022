//
//  ViewController.swift
//  Gotcha
//
//  Created by Andrew Rodriguez on 5/20/22.
//

import FirebaseFirestore
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let db = Firestore.firestore()
    
    

    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()

    
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Type your last words and hit enter to tag out"
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemBlue.cgColor
    
        return field
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(field)
        
        field.delegate = self
        
        // Do any additional setup after loading the view.
        
        
        
        
        
        let docRef = db.document("users/user1")


        docRef.getDocument {snapshot, error in

            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            print(data)
            
        
        
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        field.frame = CGRect(x:10,
                             y: view.safeAreaInsets.top+10,
                             width: view.frame.size.width-20,
                             height: 50)
        
        label.frame = CGRect(x: 10,
                             y: view.safeAreaInsets.top+70,
                             width: view.frame.size.width-20,
                             height: 100)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = textField.text, !text.isEmpty {
            

            
            tagOut(uid: "user1", lW: text)
        }
    
        return true
    }
    
    
    
    func updateData(uid: String, field: String, data: Any) {
        
        let user = uid
        
        let docRef = db.document("users/" + user)
        
        docRef.updateData([field: data
                       ])
        
    }
    
    

    
    
    func tagOut(uid: String, lW: String){
        //Reference to a specific firebase document within the collection users
        let docRef = db.document("users/" + uid)
        
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
            guard let alive = data["alive"] as? Bool else{
                return
            }
            guard let lastWords = data["lastWords"] as? String else{
                return
            }
    
            let personTaggingOut = uid
            
            self.updateData(uid: chase, field: "target", data: targ)
            self.updateData(uid: chase, field: "tags", data: tags+1)
            
            self.updateData(uid: targ, field: "chaser", data: chase)
            
            self.updateData(uid: personTaggingOut, field: "alive", data: false)
            self.updateData(uid: personTaggingOut, field: "lastWords", data: lW )
        
            
            
           
            
            
           
        
        }
        
        

        
    }
    
    

    
    
    
    

    
}
            
//            var chaser = data["chaser"]
//            var targ = data["target"]
//
//            print(chaser)
//            print(targ)
            
//            let c = "user2"
//            let t = "user1"
//
//
//
//            self.updateData(uid: c, field: "target", data: t)
            

//
//
//            let alive = data["alive"]
//            let tags = data["tags"]
//
//            print(target)
            
            
            
    
        
        
        

