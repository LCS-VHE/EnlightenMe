//
//  FakeContentPostView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-25.
//

import SwiftUI

struct SimpleConetentPostView: View {
    @State private var ProfilePictures = "ProfilePicture Placeholder"
    @State private var ProfileName = "Mr.Random"
    
    var body: some View {
        VStack{ // The Stack of the Image
            NavigationLink(destination: OtherPeopleProfileView() ){ // Going into other people page
                HStack{
                    Image("ProfilePicture Placeholder").resizable().frame(width:45, height:45).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(" \(ProfileName)")
                    Spacer() // Pushing these to the side
                }
            }
            
            NavigationLink(destination: PostContentView()){
                // THe post Image
                VStack{
                    Image("PostImage-PlaceHolder")
                        .resizable()
                        .scaledToFit()
                    
                }
                
            }
        }
    }
}

struct FakeContentPostView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleConetentPostView()
    }
}
