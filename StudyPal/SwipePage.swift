//
//  SwipePage.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI

struct SwipePage: View {
    
    private var people: [String] = ["Thomas", "Emma", "Carl", "Mike"].reversed()
    
    var body: some View {
        
        NavigationStack{
            VStack{
                ZStack {
                    ForEach(people, id: \.self) {person in
                        CardView(person: person)
                    }
                }
            }
        }
    }
    }

struct SwipePage_Previews: PreviewProvider {
    static var previews: some View {
        SwipePage()
    }
}
