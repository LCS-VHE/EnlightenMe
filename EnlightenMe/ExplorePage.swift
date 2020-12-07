//
//  ExplorePage.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct ExplorePage: View {        
    @State private var allPost:TrendingData?
    
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
                        ForEach(0..<sortedTrendingData.count, id: \.self){ num in
                            HStack{
                                SquareBoxPostView(imageurl: sortedTrendingImageURL[num], data: sortedTrendingData[num])
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
    
    func grab_data(){
        guard let url = URL(string: "\(Constants().domain)/api/explore-page") else {
            return // Can't convert string to url
        }
        print(url.absoluteURL)
        URLSession.shared.dataTask(with: url) { data, response, error in // Getting data to other posts
            if let data = data{
                if let posts = try? JSONDecoder().decode(TrendingData.self, from: data){ // Data model, data input
                    
                    allPost = posts
                    print(posts)
                    self.sortedTrendingImageURL = seperate_image_urls(data: self.allPost!.Trending)
                    self.sortedTrendingData = seperate_data_from_data(data: self.allPost!.Trending)
                    
                    self.sortedOtherPostData = seperate_data_from_data(data: self.allPost!.Others)
                    self.sortedOtherImageURL = seperate_image_urls(data: self.allPost!.Others)
                }
            }
        }.resume()
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}
