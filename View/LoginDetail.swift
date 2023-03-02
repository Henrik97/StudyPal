//
//  LoginDetail.swift
//  StudyPal
//
//  Created by Chenxi Cai on 23/02/2023.
//

import SwiftUI

struct LoginDetail: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack{
            Spacer()
        Image("Logo")
        .resizable()
        .frame(width: 180.0, height: 150.0)
        
        Text("StudyPal")
            .fontWeight(.bold)
            .padding(.bottom)
            .font(.system(size: 48))
        
        Text("Sign In And Start Your Journey")
            .font(.system(size: 20).italic())
            .foregroundColor(Color.gray)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
            Spacer()
            TextField("Enter username...", text: $username)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black, lineWidth: 2)
                )
        
            TextField("Enter password...", text: $password)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black, lineWidth: 2)
                )
            Spacer()
            
            Button(action: {
               
            }) {
                Text("Log In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(25)
            
            
        }.padding()
    }
}

struct LoginDetail_Previews: PreviewProvider {
    static var previews: some View {
        LoginDetail()
    }
}
