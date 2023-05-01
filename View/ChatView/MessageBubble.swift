//
//  MessageBubbel.swift
//  StudyPal
//
//  Created by Chenxi Cai on 03/04/2023.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading:.trailing){
            HStack{
                Text(message.text).padding()
                    .background(message.received ? Color("Gray") : Color("Green"))
                    .cornerRadius(30)
            }.frame(maxWidth:300, alignment: message.received ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime .hour().minute() ))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing)
            }
            
        }.frame(maxWidth:.infinity, alignment: message.received ? .leading : .trailing)
            .padding(message.received ? .leading : .trailing)
            .padding(.horizontal,10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id:"123",text: "Hello, how are you ",received:false, timestamp: Date()))
    }
}
