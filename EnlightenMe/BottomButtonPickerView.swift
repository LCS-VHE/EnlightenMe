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
                Image("Instagram Logo").resizable().frame(width: 50, height:50)
            }
            Spacer()
            NavigationLink(destination: Text("PlaceHolder")){
                Image("Utilities Logo").resizable().frame(width:50, height: 50)
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
