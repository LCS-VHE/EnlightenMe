//
//  ExplorePage.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct ExplorePage: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    Group{ // Trending
                        ForEach(0..<2){ num in
                            HStack{
                                Text("Trending")
                                Text("Trending")
                                Text("Trending")
                            }
                        }
                    }
                    
                    Divider()
                    HStack{ // Other Post
                        Text("Other Posts").padding()
                        Spacer()
                    }
                    Spacer()
                    
                    Group{ // Random Posts
                        ForEach(0..<10){ num in
                            HStack{
                                Text("Posts")
                                Text("Posts")
                                Text("Posts")
                            }
                        }
                    }
                    
                }
                .navigationBarTitle("Explore")
            }
        }
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}
