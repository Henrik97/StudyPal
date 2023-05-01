//
//  Message.swift
//  StudyPal
//
//  Created by Chenxi Cai on 03/04/2023.
//

import Foundation

struct Message: Identifiable,Codable{
    var id: String
    var text: String
    var received : Bool
    var timestamp: Date
    
}
