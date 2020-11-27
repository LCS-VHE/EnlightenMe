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
                    
                    HStack{ // Trending Title
                        Text("Trending")
                        Spacer()
                    }
                    
                    Group{ // Trending
                        ForEach(0..<2){ num in
                            HStack{
                                NavigationLink(destination: Text("PlaceHolder")){
                                        SquareBoxPostView()
                                    }
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
                            SquareBoxPostView()
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
