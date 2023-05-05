//
//  CardView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI
import Foundation
import Firebase

struct SwipeCardView: View {
    let db = Firestore.firestore()
    let currentEmail = Auth.auth().currentUser?.email
    var person: Person
    @State private var offset = CGSize.zero
    @State private var color: Color = .blue
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 320, height: 500)
                    .border(.white, width: 6.0)
                    .cornerRadius(4)
                    .foregroundColor(color.opacity(0.9))
                    .shadow(radius: 4)
                
                
                HStack{
                    Text(person.name)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text(person.age)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Image(systemName: "book.fill")
                        .foregroundColor(.white)
                }
            }
            .offset(x:offset.width, y:offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        offset = gesture.translation
                        withAnimation{
                            changeColor(width: offset.width)
                        }
                    } .onEnded { _ in
                        withAnimation{
                            swipeCard(width: offset.width)
                            changeColor(width: offset.width)
                        }
                    })
            
            HStack(spacing:100){
                Button(action:{swipeCard(width: -500)}){
                    Image(systemName: "x.circle")
                    
                
                    
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .background(.red)
                .cornerRadius(10)
                .controlSize(.large)
                
                Button(action:{swipeCard(width: 500)}){
                    Image(systemName: "book.fill")
                        .background(.green)
                    
                    
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .background(.green)
                .cornerRadius(10)
                .controlSize(.large)
            
            }
        }
    }
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            print("\(person.name) removed")
            offset = CGSize(width: -500, height: 0)
            
        case 150...500:
            print("\(person.name) added")
            offset = CGSize(width: 500, height: 0)
            addLike()
            checkIfMacth()
            
        default:
            offset = .zero
        }
        
    }
    func changeColor(width: CGFloat){
        switch width {
        case -500...(-150):
            color = .red
            
        case 150...500:
            color = .green
            
        default:
            color = .blue
            
        }
    }
    
    func addLike() {
       
        if let currentEmail = Auth.auth().currentUser?.email {
            db.collection("userProfiles").document(currentEmail).updateData(["likes": FieldValue.arrayUnion([person.id])]){ error in
                if error == nil{
                    
                }
            }
        }
        
    }
    func checkIfMacth() {
    let currentEmail = "henrikwoodgates97@gmail.com"
            if person.likes.contains(currentEmail){
                //push it is a match to both users on firestore and remove them from their like pool
                
                db.collection("userProfiles").document(currentEmail).updateData(["Matches": FieldValue.arrayUnion([person.id])]){ error in
                    if error == nil{
                        
                    }
                }
                // delete match from like array
                db.collection("userProfiles").document(person.id).updateData(["Matches": FieldValue.arrayUnion([currentEmail])]){ error in
                    if error == nil{
                        
                    }
                }
            }
        
            
        
    }
        
}
struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardView(person: Person(id: "202", name: "Henrik", age: "22", likes: ["test2", "test3"]))
    }
}
