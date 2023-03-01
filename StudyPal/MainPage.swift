//
//  MainPage.swift
//  StudyPal
//
//  Created by Chenxi Cai on 01/03/2023.
//

import SwiftUI

struct MainPage: View {
    @State private var goesToDetail: Bool = false
    var body: some View {
        
        
          
        NavigationStack {
           
            VStack{
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 180.0, height: 150.0)
                
                Text("StudyPal")
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .font(.system(size: 48))
                
                Rectangle()
                    .frame(width: 400,height: 1)
                
            }
        
            
            VStack{
                Spacer()
                NavigationLink(destination: LoginDetail()){
                    
                    Text("Log In")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2))
                    
                    
                }.background(Color.black)
                    .cornerRadius(25)
                Spacer()
            }
            
        }
                
                    
                    
                    
            
            
        }
    
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
