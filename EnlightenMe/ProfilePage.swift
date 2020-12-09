//
//  ProfilePage.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct ProfilePage: View {
    private var userName = "Mr.Random"
    private var posts = 0
    private var profilePicture = "ProfilePicture-PlaceHolder"
    private var followers = Int.random(in: 200...2000)
    private var accountId = 1 // The Most important part of it
    @State private var userposts:AllContentPostViewData!
    
    @State private var sortedImagesURL = [[String]]() // For the square box post view
    @State private var sortedData = [[ContentPostViewData]]()
    
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
                            VStack{
                                Text("Posts")
                                    .multilineTextAlignment(.center)
                                Text("\(posts)")
                                    .multilineTextAlignment(.center)
                            }
                            Spacer()
                            
                            VStack{
                                Text("Follower")
                                    .multilineTextAlignment(.center)
                                Text("\(followers)")
                                    .multilineTextAlignment(.center)
                            }
                            
                            Spacer()
                            
                            VStack{
                                Text("Following")
                                    .multilineTextAlignment(.center)
                                Text("\(followers + 10)")
                                    .multilineTextAlignment(.center)
                            }
                            
                            Spacer()
                        }
                        
                    }
                    Divider() // A line diving stuff
                    Group{ // A list of posts
                        ForEach(0..<sortedImagesURL.count, id: \.self){ num in
                            SquareBoxPostView(imageurl: sortedImagesURL[num], data: sortedData[num])
                            
                        }
                    }
                    
                    Spacer()
                }
                
                .navigationBarTitle("My Profile")
            }.onAppear(perform: get_users_posts)
        }
    }
    
    func get_users_posts(){ // Get users posts
        guard let  url = URL(string: "\(Constants().domain)/api/get-own-post/\(self.accountId)") else {
            return
        }
        
        
        print("\(Constants().domain)/api/get-own-post/\(self.accountId)")
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Hello")
            if let data = data{
                if let posts = try? JSONDecoder().decode(AllContentPostViewData.self, from: data){ // Data model, data input
                    
                    self.userposts = posts
                    self.sortedImagesURL = seperate_image_urls(data: userposts)
                    self.sortedData = seperate_data_from_data(data: self.userposts)
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
