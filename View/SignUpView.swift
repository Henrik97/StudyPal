//
//  SignUpView.swift
//  StudyPal
//
//  Created by Chenxi Cai on 02/03/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var showingEmail = true
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    

    
    var body: some View {
        NavigationStack{
            
        VStack{
            
            HStack{
                Text("Sign Up")
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            
            Spacer()

///The switch is not finished
            Toggle(isOn: $showingEmail,
                   label: {
                Text("E-mail/Phone Number ")
                

            })
            
            if showingEmail {
                    Label("E-mail", systemImage: "mail.fill")
                TextField("Email adress", text: $email)
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .frame(width: 380)
                    
                
            } else {
                Label("Phone Number", systemImage: "phone.fill")
                TextField("Phone number", text: $phoneNumber)                .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .frame(width: 380)
            }
            
            Spacer()
        
                NavigationLink(destination: ContentView() ){
                    Text("Continue")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2))
                }.background(Color.green)
                    .cornerRadius(25)
                    .padding(.bottom)
        }
           
            

            VStack{
                
                Text("Or")
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: 100))
                    path.addLine(to: CGPoint(x: 400, y: 100))
                }
                .stroke(style: StrokeStyle( lineWidth: 1, dash: [5]))
                
                Button{}label:{
                    Label("Continue with Google", systemImage: "google")

                }.background(Color.green)
                    .clipShape(Capsule())

                Button{}label:{
                    Label("Continue with Facebook", systemImage: "google")
                }
                .background(Color.green)
                    .clipShape(Capsule())
                
                Button{}label:{
                    Label("Continue with Apple", systemImage: "google")
                }.background(Color.green)
                    .clipShape(Capsule())
                Spacer()
            }
            
            NavigationLink(destination: LogInView()){
                Text("Already have an account?")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
