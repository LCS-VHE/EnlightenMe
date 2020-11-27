//
//  ContentView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomePageView()
                .tabItem{
                    Image(systemName: "star.fill") // Place holder image
                    Text("Home Page") // Title Home Page
                }
            
            ToolsNavigation()
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Utility")
                }
            
            ProfilePage()
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Profile Page")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
