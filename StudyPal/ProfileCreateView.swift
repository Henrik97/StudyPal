//
//  ContentView.swift
//  StudyPal
//
//  Created by Chenxi Cai on 16/02/2023.
//

import SwiftUI
import UIKit
import Firebase


private let db = Firestore.firestore()

struct DaysOfStudy: Identifiable {
    var id: String
    var isChosen = false
}
enum ActiveAlert {
    case succes, error
}

struct ProfileCreateView: View {
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var birthdate = Date()
    @State private var age = 0
    @State private var university: String = ""
    @State private var fieldOfStudy: String = ""
    @State private var degree: String = ""
    @State private var timeOfDayPrefered: String = ""
    @State var daysOfStudy = [
        DaysOfStudy(id: "Monday", isChosen: false),
        DaysOfStudy(id: "Tuesday", isChosen: false),
        DaysOfStudy(id: "Wednesday", isChosen: false),
        DaysOfStudy(id: "Thursday", isChosen: false),
        DaysOfStudy(id: "Friday", isChosen: false),
        DaysOfStudy(id: "Saturday", isChosen: false),
        DaysOfStudy(id: "Sunday", isChosen: false)
    ]
    
    @State var text: String = ""
    @State var tags: [Tag] = []
    @State var tag: String = ""
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .error
    
    
    
    let rows = [
        GridItem(.fixed(100), spacing: 10),
    ]
    
    func test(){
        print("you added picture")
    }
    
    
    var body: some View {
        
        NavigationView {
            
            
            
            Form{
                
                Section(header: Text("Personal Information")){
                    TextField("Email Adress", text: $email)
                    TextField("Name", text: $name)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }
                Section(header: Text("Study information")){
                    
                    Picker(selection: $university,
                           label: Text("University"),
                           content: {
                        Text("DTU").tag("1")
                        Text("CBS").tag("2")
                    })
                    TextField("Field of Study", text: $fieldOfStudy)
                    Picker(selection: $degree,
                           label: Text("Degree"),
                           content: {
                        Text("Bachelor").tag("1")
                        Text("Master").tag("2")
                        Text("Diplom").tag("3")
                        Text("PHD").tag("4")
                    })
                    
                    Picker("Prefered Time of Day", selection: $timeOfDayPrefered,
                           content: {
                        Text("Early Bird").tag("1")
                        Text("Night Owl").tag("2")
                        Text("No Prefernce").tag("3")
                        
                    })
                    
                    
                     
                     Section{
                     ForEach($daysOfStudy) { $day in
                     
                     
                     Toggle(day.id, isOn: $day.isChosen)
                     
                     
                     }
                     
                     }
                     Section{
                     Toggle("All days", sources: $daysOfStudy, isOn: \.isChosen)
                     }
                     }
                     
                     
                     
                     Section(header: Text("Profile Information")){
                     
                
                     
                     
                    
                    
                    HStack{
                        TextField("Add tags", text: $text)
                            .font(.title3)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(Color("Tag").opacity(0.2),lineWidth: 1))
                        
                        
                        
                        
                        Button("add"){
                            
                            tags.append(Tag(text: text))
                            text = ""
                        }.buttonStyle(.borderedProminent)
                            .disabled(text == "")
                        
                    }
                    TagView(maxLimit: 6, tags: $tags)
                    
                        .frame(height: 120)
                    
                    
                }
                .padding(.horizontal, 20)
                
                Button( action: createProfile ,label: {Text("save")})
                    .padding(.leading, 120.0)
                    .buttonStyle(.borderedProminent)
                
                
            }
            
            
            
        }
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .succes:
                
                return Alert(title: Text("Sucess"), message: Text("Information Saved"), dismissButton: .default(Text("OK")))
            case .error:
                return Alert(title: Text("Error"), message: Text("Please fill in all the required fields"), dismissButton: .default(Text("OK")))
                
            }
            
        }
    }
    
    func calculateAge(birthdate: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let age = calendar.dateComponents([.year], from: birthdate, to: currentDate)
        
        return age.year ?? 0
    }
    func addDate(){
        
    }
    
    func createProfile() {
        age = calculateAge(birthdate: birthdate)
        self.showAlert = true
        guard !email.isEmpty, !name.isEmpty else {
            self.activeAlert = .error
            print("test")
            return
        }
        
        self.activeAlert = .succes
        
        let userProfile =
        ["email": email, "name": name, "age": age] as [String : Any]
        
        db.collection("userProfiles").document(email).setData(userProfile){ error in
            if let error = error {
                print("Failed to save profile: \(error)")
                
            }
            
        }
        
    }
}


    struct ProfileCreateView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileCreateView()
        }
    }


