//
//  TitleRow.swift
//  StudyPal
//
//  Created by Chenxi Cai on 03/04/2023.
//

import SwiftUI

struct TitleRow: View {
    
    
    var imageUrl = URL(string:"https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3NDAwMDkzMQ&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080" )
    var name = "John Doe"

    var body: some View {
        
        HStack (spacing:20) {
            AsyncImage(url: imageUrl){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50,height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                    .foregroundColor(.black)
                Text("Online").font(.caption).foregroundColor(.gray)
            }.frame(maxWidth:.infinity,alignment: .leading)
            Image(systemName: "phone.fill").padding(10).foregroundColor(.green)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 0.1)
                }
        }.padding()
        Divider()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow().background(Color(.white))
    }
}
