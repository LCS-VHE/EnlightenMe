//
//  HomePageView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct HomePageView: View {
    @State private var aboutProjectLinkInfo:[AboutProjectLinkData] = getAboutProjectLinkData() // Data for the about project link view
    
    // Variables for getting data from website
    @State private var posts:AllContentPostViewData?
    @State private var sortedPost:[[ContentPostViewData]] = [[ContentPostViewData]] ()
    @State private var sortedImageURL:[[String]] = [[String]]()
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    Group{
                        HStack{ // Title
                            Text("User Posts: ").padding()
                            Spacer()
                        }
                        
                        ForEach(0..<10){ index in // The Content Post View
                            SimpleConetentPostView()
                            
                        }
                        
                        
                    }
                    
                    
                }
                
            }
            .navigationBarTitle("Enlightenment")
        }.onAppear(perform: getPosts)
    }
    
    func getPosts(){ // Getting some posts
        guard let url = URL(string: "\(Constants().domain)/api/get-recent-posts") else {
            return // Not working
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in // Getting data to other posts
            if let data = data{
                if let posts = try? JSONDecoder().decode(AllContentPostViewData.self, from: data){ // Data model, data input
                    
                    self.posts = posts
                    self.sortedImageURL = seperate_image_urls(data: self.posts!.Posts)
                    self.sortedPost = seperate_data_from_data(data: self.posts!.Posts)
                    
                    print(self.posts)
                    return
                }
            }
        }.resume()
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
