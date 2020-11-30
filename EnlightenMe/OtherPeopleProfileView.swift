//
//  OtherPeopleProfileView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct OtherPeopleProfileView: View {
    @State private var userName = "Debug User"
    @State private var Followers = 10
    @State private var posts = 10
    @State private var placeHolderValue = 10
    
    var body: some View {
        VStack{
            ScrollView{
                HStack{ // About Him Page
                    VStack{
                        Image("ProfilePicture-PlaceHolder").resizable().frame(width:75, height: 75).clipShape(Circle()).padding()
                        Text("\(userName)")
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("Follower\n\(Followers)")
                        .multilineTextAlignment(.center)
                    Spacer()
                    Text("Posts\n\(posts)")
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    Text("PlaceHolder\n\(placeHolderValue)")
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                Divider() // Dividing against user to post
                
                ForEach(0..<10){ num in
                    SquareBoxPostView()
                }
            }
                .navigationBarTitle(userName)
        }
    }
}

struct OtherPeopleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPeopleProfileView()
    }
}
