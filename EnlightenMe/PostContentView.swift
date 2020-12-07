//
//  PostContentView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostContentView: View {
    @State var data:ContentPostViewData = ContentPostViewData(postId: 1, accountId: 1, timestamp: 1, madeWith: "Neural Style Transfer", post_image_url: "https://asdf.com", title: "A Cool image that I've made", Captions: "A Cool image that I've made", likes: 0, isPrivate: 0) // Default values for the data variable
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{ // Profile Image and UserName
//                    NavigationLink( destination: OtherPeopleProfileView() ){
//                        Image(profileimage) // Change in the future
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width:50, height:50)
//                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                            .padding()
//                        Text(data.accountId)
//                    }
                    
                    Spacer()
                }
                
                WebImage(url: URL(string: data.post_image_url))
                    .resizable()
                    .scaledToFit() // The Image
                Text("\(data.Captions)") // The Text
                Text("Made With: \(data.madeWith)") // What it is made out of
                Spacer()
                    
            }
        }
        
    }
}

struct PostContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView()
    }
}
