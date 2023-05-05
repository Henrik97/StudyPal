//
//  PersonVIewModel.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 04/05/2023.
//

import Foundation
import Firebase

class PersonViewModel: ObservableObject {
    
    @Published var users: [Person] = []
    
    func getUserProfiles() {
        
        let db = Firestore.firestore()
        
        db.collection("userProfiles").getDocuments { snapshot, error in if error == nil{
            if let snapshot = snapshot{
                DispatchQueue.main.async {
                    self.users = snapshot.documents.map { d in
                        return Person(id: d.documentID,
                                      name: d["name"] as? String ?? "",
                                        age: d["age"] as? String ?? "",
                                      likes: d["likes"] as? [String] ?? [""])
                    }
                }
            }
        }
            
            else{
                //Need to make error handling
            }
        }
    }
    
}
