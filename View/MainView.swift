//
//  MainView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI


struct MainView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some View {
        TabView(){
            MainChatView()
                .tabItem{
                    Image(systemName: "text.bubble.fill")
                    Text("Chat")
                }
            SwipeView()
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

