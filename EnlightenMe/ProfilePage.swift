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
    private var accountId = 1 // The Most important part of it
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    Group{ // Showing profile picture and Followers
                        HStack{
                            VStack{
                                Image("ProfilePicture-PlaceHolder").resizable().frame(width:75, height: 75).clipShape(Circle()).padding()
                                Text("\(userName)")
                            }
                            
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
                        ForEach(0..<10){ num in
                            SquareBoxPostView()
                            
                        }
                    }
                    
                    Spacer()
                }
                
                .navigationBarTitle("My Profile")
            }.onAppear(perform: get_users_posts)
        }
    }
    
    func get_users_posts(){ // Get users posts
        print("\(Constants().domain)/api/get-posts-from-user/\(self.accountId)")
        guard let  url = URL(string: "\(Constants().domain)/api/get-posts-from-user/\(self.accountId)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                print("Hello")
                if let posts = try? JSONDecoder().decode(AllContentPostViewData.self, from: data){ // Data model, data input
                    
                    print(posts)
                }
            }
            print("Hello")
        }.resume()
    }
    
    func get_about_profile(){ // Get about profile post
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
