//
//  LogInView.swift
//  StudyPal
//
//  Created by Chenxi Cai on 23/02/2023.
//

import SwiftUI

struct LogInView: View {

    
    var body: some View {
        NavigationStack{
            VStack{
                LoginDetail()
                
                NavigationLink(destination: MainView()){
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
                    .padding(.bottom)
            
                
            }.padding()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
