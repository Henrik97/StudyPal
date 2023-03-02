//
//  PathView.swift
//  StudyPal
//
//  Created by Chenxi Cai on 01/03/2023.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        
        VStack{
            
            Path() { path in
                path.move(to: CGPoint(x: 0, y: 500))
                path.addQuadCurve(to: CGPoint(x: 100, y: 500), control: CGPoint(x: 50, y:470))
                
                path.addQuadCurve(to: CGPoint(x: 200, y: 500), control: CGPoint(x: 150, y:470))
                
                
                path.addQuadCurve(to: CGPoint(x: 300, y: 500), control: CGPoint(x: 250, y:470))
                
                path.addQuadCurve(to: CGPoint(x: 400, y: 500), control: CGPoint(x: 350, y:470))
                
            
            }
            .stroke(Color.blue,lineWidth: 5)
            
            
         

            
        }
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
