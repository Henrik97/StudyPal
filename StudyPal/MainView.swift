//
//  MainView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView(){
            ChatView()
                .tabItem{
                    Image(systemName: "text.bubble.fill")
                    Text("Chat")
                }
            SwipePage()
                .tabItem {
                    Image(systemName:"book.fill")
                    Text("Match")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                    
                }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

