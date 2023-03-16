//
//  ContentView.swift
//  StudyPal
//
//  Created by Chenxi Cai on 16/02/2023.
//

import SwiftUI
import UIKit


struct DaysOfStudy: Identifiable {
    var id: String
    var isChosen = false
}

struct ContentView: View {
    @State private var username: String = ""
    @State private var name: String = ""
    @State private var birthdate = Date()
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
    
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    @StateObject var dataModel = DataModel()
    
    
    
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
                    TextField("Email Adress", text: $username)
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
                        
                        
                        NavigationStack {
                            GridView()
                        }
                        .environmentObject(dataModel)
                        .frame(height: 200)
                        .frame(width: 300)
                        
                        
                        
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
                            .border(Color.gray)
                        
                        
                        
                        
                    }
                    .padding(.horizontal, 20)
                    
                    Button("create"){}
                        .padding(.leading, 120.0)
                        .buttonStyle(.borderedProminent)
                    
                }
                
                
                
            }
            
        }
    }
    

        
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
