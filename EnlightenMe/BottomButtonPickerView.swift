//
//  BottomButtonPickerView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-25.
//

import SwiftUI

struct BottomButtonPickerView: View {
    var body: some View {
        HStack{
            Spacer()
            NavigationLink(destination: Text("PlaceHolder")){
                Image("Home Logo").resizable().frame(width: 40, height:40)
            }
            
            Spacer()
            NavigationLink(destination: Text("PlaceHolder")){
                Image("Instagram Logo").resizable().frame(width: 40, height:40)
            }
            
            Spacer()
            
            NavigationLink(destination: ToolsNavigation()){
                Image("Utilities Logo").resizable().frame(width:40, height: 40)
            }
            
            Spacer()
        }
    }
}

struct BottomButtonPickerView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonPickerView()
    }
}
