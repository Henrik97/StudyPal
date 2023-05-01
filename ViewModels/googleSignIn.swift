//
//  googleSignIn.swift
//  StudyPal
//
//  Created by Chenxi Cai on 20/03/2023.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn


class google_signin: ObservableObject{
    @Published var isLoginsuccessed = false
    
    func signInWithGoogle(){
        //get clientid
        guard let clientID = FirebaseApp.app()?.options.clientID else {return}
        
        //create google signin configuration object
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        //signin method
        GIDSignIn.sharedInstance.signIn(
            withPresenting: Application_utility.rootViewController
        ){
            user,error in
            
            if let error = error{
                print(error.localizedDescription)
                return }
            
            guard
                let user = user?.user,
                let idToken = user.idToken else {return}
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) {res, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = res?.user else{return}
                print(user)
            }
        }
    }
}
