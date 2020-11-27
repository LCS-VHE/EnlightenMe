//
//  SquareBoxPostView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct SquareBoxPostView: View {
    private var imagesName = ["AboutProjectLinkView-Placeholder", "AboutProjectLinkView-Placeholder", "AboutProjectLinkView-Placeholder"]
    var body: some View {
        HStack{
            ForEach(0..<imagesName.count){ num in
                NavigationLink(destination: Text("Place Holder \(num)")){
                    Image(imagesName[num]).resizable().scaledToFit()
                }
            }
        }
    }
}

struct SquareBoxPostView_Previews: PreviewProvider {
    static var previews: some View {
        SquareBoxPostView()
    }
}
