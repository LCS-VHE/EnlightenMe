//
//  ExplorePage.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct ExplorePage: View {        
    @State private var trendingPost:AllContentPostViewData!
    @State private var otherPost:AllContentPostViewData!
    
    @State private var sortedTrendingData = [[ContentPostViewData]]() // Post content view Data
    @State private var sortedTrendingImageURL = [[String]]()
    
    @State private var sortedOtherPostData = [[ContentPostViewData]]() // Second page data
    @State private var sortedOtherImageURL = [[String]]()

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Divider()
                    HStack{ // Trending Title
                        Text("Trending")
                        Spacer()
                    }
                    
                    Group{ // Trending
                        ForEach(0..<2){ num in
                            HStack{
                                SquareBoxPostView()
                            }
                        }
                    }
                    
                    
                    Divider()
                    
                    HStack{ // Other Post
                        Text("Other Posts")
                        Spacer()
                    }
                    Spacer()
                    
                    Group{ // Random Posts
                        ForEach(0..<sortedOtherPostData.count, id: \.self){ num in
                            SquareBoxPostView(imageurl: sortedOtherImageURL[num], data: sortedOtherPostData[num])
                        }
                    }
                    
                }
                .navigationBarTitle("Explore")
            }
        }.onAppear(perform: grab_data)
    }
    
    func grab_data(){ // Getting the trending data and other data
        guard let url = URL(string: "\(Constants().domain)/api/get-recent-posts") else {
            return // Can't convert string to url
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in // Getting data to other posts
            print("Hello")
            if let data = data{
                if let posts = try? JSONDecoder().decode(AllContentPostViewData.self, from: data){ // Data model, data input
                    self.otherPost = posts
                    self.sortedOtherImageURL = seperate_image_urls(data: otherPost)
                    self.sortedOtherPostData = seperate_data_from_data(data: otherPost)
                    
                }
            }
            print("Hello")
        }.resume()
    
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}
