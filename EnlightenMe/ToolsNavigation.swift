//
//  ToolsNavigation.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-25.
//

import SwiftUI

struct ToolsNavigation: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("    A List of Tools:")
                    Spacer()
                }
                VStack{
                    List{
                        NavigationLink(destination: StyleTransfereUtilityView()){ // Neural Style Transfere
                            
                            HStack{ // Showing image in A List
                                Text("Neural Style Transfer")
                                Spacer()
                                Image("PostImage-PlaceHolder").resizable().frame(width:50, height: 50) // Place holder Image
                            }
                        }
                        
                        NavigationLink(destination: AnimeFaceCreating()){ // Link to anime face creator
                            HStack{
                                Text("Anime Face Creator")
                                Spacer()
                                Image("Anime-Face-Placeholder").resizable().frame(width:50, height: 50)
                            }
                        }
                        
                    }}
            }
         
            .navigationBarTitle("Tools")
        }
    }
}


struct ToolsNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ToolsNavigation()
    }
}
