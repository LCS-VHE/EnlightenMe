//
//  ProfilePage.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct ProfilePage: View {
    private var userName = "Test_User"
    private var posts = 0
    private var Followers = 68
    private var placeHolderValue = 68
    private var profilePicture = "ProfilePicture-PlaceHolder"
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    Group{ // Showing profile picture and Followers
                        HStack{
                            Image("ProfilePicture-PlaceHolder").resizable().frame(width:100, height: 100).clipShape(Circle()).padding()
                            
                            Spacer()
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
                        
                        
                    }
                    Divider() // A line diving stuff
                    Group{ // A list of posts
                        
                    }
                    
                    Spacer()
                }
                
                .navigationBarTitle("My Profile")
            }
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
