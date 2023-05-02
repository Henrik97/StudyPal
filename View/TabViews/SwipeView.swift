//
//  SwipePage.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI

struct SwipeView: View {
    
    private var people: [String] = ["Thomas", "Emma", "Carl", "Mike"].reversed()
    
    var body: some View {
        
        NavigationStack{
            VStack{
                ZStack {
                    ForEach(people, id: \.self) {person in
                        SwipeCardView(person: person)
                    }
                }
            }
        }
    }
    }

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
