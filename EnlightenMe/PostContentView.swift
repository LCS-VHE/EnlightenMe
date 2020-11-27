//
//  PostContentView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct PostContentView: View {
    private var bodyText = "A Cool image that I've made"
    private var image = "AboutProjectLinkView-Placeholder"
    private var profileimage = "ProfilePicture Placeholder"
    private var userName = "PlaceHolder UserName"
    private var madeWith = "Neural Style Transfer"
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{ // Profile Image and UserName
                    NavigationLink(destination:OtherPeopleProfileView()){
                        Image(profileimage)
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height:50)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .padding()
                        Text(userName)
                    }
                    
                    Spacer()
                }
                
                Image(image).resizable().scaledToFit() // The Image
                Text("\(bodyText)") // The Text
                Text("Made With: \(madeWith)") // What it is made out of
                Spacer()
                    
                    .navigationBarTitle("Post")
            }
        }
        
    }
}

struct PostContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView()
    }
}
