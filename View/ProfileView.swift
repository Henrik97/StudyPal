
//
//  ProfileView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 30/03/2023.
//

import SwiftUI
import Firebase

class UserProfile: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var age = 0
    
    private let db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
     func fetchProfile() {
     
     
     listenerRegistration = db.collection("userProfiles").document("henrikWoodgates1997").addSnapshotListener { snapshot, error in
     if let error = error {
     print("Error fetching profile: \(error.localizedDescription)")
     return
     }
     
     guard let data = snapshot?.data() else { return }
     
     self.name = data["name"] as? String ?? ""
     self.email = data["email"] as? String ?? ""
     self.age = data["age"] as? Int ?? 0
     }
     }
     }

     
     
     private let db = Firestore.firestore()
     
     

    struct ProfileView: View {
        @State var membershipType = "Basic"
        @StateObject private var userProfile = UserProfile()
        var body: some View {
            NavigationView {
                
                VStack{
                VStack{
                    Image("Profil-Icon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    Text("\(userProfile.name) \(String(userProfile.age))")
                        .font(.title)
                        .fontWeight(.bold)
                }
                    HStack(alignment: .top, spacing: 20){
                        
                        
                        NavigationLink(destination: ProfileCreateView()){
                            VStack{
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 70, height: 70)
                                        .shadow(radius: 20)
                                    Image(systemName: "gearshape.fill")
                                        .resizable(resizingMode: .stretch)
                                        .padding()
                                        .foregroundColor(Color.gray)
                                        .frame(width: 80, height: 80)
                                    
                                    
                                }
                                
                                
                                
                                
                                Text("Edit")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                            }
                        NavigationLink(destination: MediaView()){
                            VStack{
                                ZStack{
                                    Circle()
                                        .fill(.green)
                                        .frame(width: 80, height: 80)
                                        .shadow(radius: 20)
                                    Image(systemName: "photo.fill.on.rectangle.fill")
                                        .resizable(resizingMode: .stretch)
                                        .padding()
                                        .foregroundColor(Color.white)
                                        .frame(width: 80, height: 80)
                                        .overlay(
                                            ZStack{
                                                Circle()
                                                    .fill(.white)
                                                    .frame(width:25, height: 25)
                                                Image(systemName: "plus")
                                                    .resizable(resizingMode: .stretch)
                                                    .aspectRatio(contentMode: .fill)
                                                    .foregroundColor(Color.green)
                                                    .frame(width:15, height: 15)
                                            }
                                                .offset(x:4, y: 60), alignment: .topTrailing
                                            )
                                  
                                        
                                       
                                    
                                }
                                
                                
                                    
                                    
                                Text("Add Image")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }.offset(y:20)
                            
                        }
                        NavigationLink(destination: MembershipView()){
                            VStack{
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 70, height: 70)
                                        .shadow(radius: 20)
                                    Image(systemName: "creditcard.fill")
                                        .resizable()
                                        .padding()
                                        .foregroundColor(Color.gray)
                                        .frame(width: 70, height: 70)
                                    
                                    
                                }
                                
                                
                                
                                
                                Text("Add \n membership+")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                            }
                        
                       
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    Form {
                        
                        LabeledContent("Membership:", value: membershipType)
                        LabeledContent("Email:", value: membershipType)
                        LabeledContent("Phone:", value: membershipType)
                        LabeledContent("Lokation:", value: membershipType)
                        
            
                    }
                   
                   
                        
                      
                    Spacer()
                    // add a logout button

                    
                  
                }.onAppear{
                    userProfile.fetchProfile()
                }
               
            }
        }
     
        
        
    }
    
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }

