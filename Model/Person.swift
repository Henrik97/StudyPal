//
//  Person.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 04/05/2023.
//

import Foundation

struct Person: Identifiable {
    
    var id: String
    var name: String
    var age: String
    var likes: [String]
    var matches: [String]??

}
