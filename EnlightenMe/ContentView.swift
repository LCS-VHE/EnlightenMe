//
//  ContentView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-24.
//

import SwiftUI

struct ContentView: View {
    @State private var projects = []
    @State private var domain = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    Text("Enlighten Me")
                        .font(.body)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.gray)
                    
                    Group{ // The group for the Enlighten Me
                        VStack{
                            HStack{
                                Text("   About Projects: ") // The Space Bars are for the better looking view
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{ // The Navigation Link for About Project Page
                                    HStack{
                                        ForEach(0..<10){index in
                                            NavigationLink(destination: Text("PlaceHolder") ){
                                                AboutProjectLinkView()
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                        
                        
                    }
                }
                Spacer()
                HStack{ // Bottom Of the Screen Stuff
                    Text("Bottom Of the Screen Buttons View")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
