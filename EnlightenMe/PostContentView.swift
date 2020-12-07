//
//  PostContentView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostContentView: View {
    @State var data = ContentPostViewData(postId: 1, accountId: 1, timestamp: 1, madeWith: "Neural Style Transfer", post_image_url: "http://127.0.0.1:5000/file/image/1607225993.5122628.jpeg", title: "A Cool image that I've made", Captions: "A Cool image that I've made", likes: 0, isPrivate: 0) // Default values for the data variable
    var profileimage = "ProfilePicture Placeholder"
    @State private var showMore = false
    
    var body: some View {
        VStack{
            HStack{ // Profile Image and UserName
                NavigationLink(destination: OtherPeopleProfileView()){
                    Image(profileimage)
                        .resizable()
                        .frame(width:50, height:50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text("\(data.accountId)")
                }
                
                
                Spacer()
            }
            
            WebImage(url: URL(string: data.post_image_url))
                .resizable()
                .scaledToFit() // The Image
            HStack{ // A list of buttons
                Button(action: {
                    
                }){
                    Text("Image One")
                }
                
                Button(action: {
                    
                }){
                    Text("Image Two")
                }
                
                Button("Show More"){
                    // Do Show More Data
                    self.showMore = true // Showing more elements
                }.disabled(self.showMore)
            }
            VStack{
                Text("\(data.title)")
                    .font(.headline)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                   
                
                if showMore{
                    Text("\(data.Captions)")// The Text
                        .font(.footnote)
                        .fontWeight(.ultraLight)
                    Text("Made With: \(data.madeWith)")
                    
                }
            }
        }
        
        
    }
}

struct PostContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView()
    }
}
