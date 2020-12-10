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
                    Image(systemName: "homekit") // Place holder image
                    Text("Home Page") // Title Home Page
                }
            
            ToolsNavigation()
                .tabItem{
                    Image(systemName: "scribble")
                    Text("Utility")
                }
            
            ExplorePage()
                .tabItem{
                    Image(systemName: "viewfinder")
                    Text("Explore")
                }
            
            ProfilePage()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
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
