//
//  MainChatView.swift
//  StudyPal
//
//  Created by Chenxi Cai on 03/04/2023.
//

import SwiftUI


struct MainChatView: View {
    @StateObject var messagesManager = MessagesManager()
    
    
    var body: some View {
        VStack{
            VStack{
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id:\.id){ message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                .background(.white)
                .onChange(of: messagesManager.lastMessageId){ id in
                    withAnimation{
                        proxy.scrollTo(id,anchor: .bottom)
                        
                    }
                   
                }
                }
                
            }
            .background(Color(.white))
            MessageField().environmentObject(messagesManager)
        }
    }
}

struct MainChatView_Previews: PreviewProvider {
    static var previews: some View {
        MainChatView()
    }
}
