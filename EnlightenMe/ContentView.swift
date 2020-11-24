//
//  ContentView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Enlighten Me")
                    .font(.body)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.gray)
                
                Group{ // The group for the Enlighten Me
                    VStack{
                        HStack{
                            Text("Title")
                                .padding()
                            Spacer()
                        }
                        HStack{
                            HStack{
                                Text("Navigation View")
                                Text("Navigation View")
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
