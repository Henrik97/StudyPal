//
//  ProfileView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 30/03/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack{
                Image("Profil-Icon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Text("Name")
                
                Text("Information")
                //List Email, Phone, User options
                
                
                
                NavigationLink(destination: ProfileCreateView()){
                    Text("Change")
                }
                
                // add a logout button
                Button( action: logout, label: {Text("logout")})
                    
                
                
            }
            
        }
      
    }
    func logout(){
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
