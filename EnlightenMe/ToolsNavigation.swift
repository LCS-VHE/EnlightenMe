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
                ScrollView{
                    NavigationLink(destination: Text("Place Holder")){ // Link to anime face creator
                        Text("Anime Face Creator")
                    }
                    
                    NavigationLink(destination: Text("Place Holder")){ // Neural Style Transfere
                        Text("Neural Style Transfere")
                    }
                    
                    NavigationLink(destination: Text("Place Holder")){ // Real Human Face Creator
                        Text("Real Human Face Creator")
                    }
                    
                    NavigationLink(destination: Text("Place Holder")){ // Link to anime face creator
                        Text("William Shakespeare Generator")
                    }
                }
                Spacer()
                
                BottomButtonPickerView()
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
