//
//  SwipePage.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI
import Firebase

struct SwipeView: View {
    
    @ObservedObject var model = PersonViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack{
                ZStack {
                    ForEach(model.users) {user in
                        SwipeCardView(person: Person(id: user.id, name: user.name, age: user.age, likes: user.likes))
                    }
                }
            }
        }
       
    }
    init() {
        model.getUserProfiles()
    }
    }


struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
