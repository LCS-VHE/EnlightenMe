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
                    Text("Home Page") // Title Home Pag
                }
            
            ToolsNavigation()
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Utility")
                }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
