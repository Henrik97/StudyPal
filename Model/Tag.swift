//
//  Tag.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 24/02/2023.
//

import SwiftUI


struct Tag: Identifiable,Hashable {
    
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
    
}
