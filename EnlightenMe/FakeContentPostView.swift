//
//  FakeContentPostView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-25.
//

import SwiftUI

struct ContentPostView: View {
    @State private var ProfilePictures = "ProfilePicture Placeholder"
    @State private var ProfileName = "PlaceHolder Name"
    @State private var madeWith = "Neural Style Transfere"
    @State private var Likes = 0
    
    var body: some View {
        VStack{ // The Stack of the Image
            HStack{
                Image("ProfilePicture Placeholder").resizable().frame(width:45, height:45).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text(" \(ProfileName)")
                Spacer() // Pushing these to the side
            }
            
            // THe post Image
            Image("PostImage-PlaceHolder")
                .resizable()
                .scaledToFit()
                .frame(width: 390, height: 390)
            
            HStack{    // Images at the bottom to make it look good
                Image("Like").resizable().frame(width:35, height: 35)
                Image("Comment").resizable().frame(width:35, height: 35)
                Image("Share").resizable().frame(width:35, height: 35)
                Spacer()
                
                Text("Made With \(self.madeWith)")
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}

struct FakeContentPostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPostView()
    }
}
