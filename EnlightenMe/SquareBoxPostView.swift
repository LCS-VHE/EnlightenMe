//
//  SquareBoxPostView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI
import SDWebImageSwiftUI

struct SquareBoxPostView: View {
    // It will take in two object one for the view the next for the next view
    @State  var imageurl = [String]() // Optionals to prevent crashing
    @State  var data = [ContentPostViewData]() // Optionals to prevent crashing
    
    
    var body: some View {
        HStack{
            ForEach(0..<imageurl.count){ num in
                NavigationLink(destination: PostContentView(data: data[num])){
                    WebImage(url: URL(string:imageurl[num])).resizable().scaledToFit()
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
