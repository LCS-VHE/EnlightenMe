//
//  FakeContentPostView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SimpleConetentPostView: View {
    @State private var ProfilePictures = "ProfilePicture Placeholder"
    @State private var ProfileName = "Mr.Random"
    
    @State var data:[ContentPostViewData] = [ContentPostViewData]()
    @State var imageURL:[String] = [String]()
    
    var body: some View {
        VStack{ // The Stack of the Image
            ForEach(0..<imageURL.count){ num in
                
                NavigationLink(destination: OtherPeopleProfileView() ){ // Going into other people page
                    HStack{
                        Image("ProfilePicture Placeholder").resizable().frame(width:45, height:45).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        Text(" \(ProfileName)")
                        Spacer() // Pushing these to the side
                    }
                }
                
                NavigationLink(destination: PostContentView(data: data[num])){
                    // THe post Image
                    VStack{
                        WebImage(url: URL(string: imageURL[num]))
                            .resizable()
                            .scaledToFit()
                        
                    }
                    
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
