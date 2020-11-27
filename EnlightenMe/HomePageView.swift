//
//  HomePageView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct HomePageView: View {
    @State private var aboutProjectLinkInfo:[AboutProjectLinkData] = getAboutProjectLinkData() // Data for the about project link view
    private var domain:String = Constants().domain // The domain of the api
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    //                    Text("Enlighten Me")
                    //                        .font(.largeTitle)
                    //                        .fontWeight(.ultraLight)
                    //                        .foregroundColor(Color.gray)
                    
                    Group{ // The group for the Enlighten Me
                        HStack{
                            Text("   About Projects:") // The Space Bars are for the better looking view
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){ // The scroll View
                            HStack{ // The Navigation Link for About Project Page
                                HStack{
                                    ForEach(0..<aboutProjectLinkInfo.count){index in
                                        NavigationLink(destination: Text("PlaceHolder") ){
                                            AboutProjectLinkView(Data: aboutProjectLinkInfo[index])
                                            
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                        
                        
                    }
                    Group{
                        HStack{ // Title
                            Text("   Followed User Post:")
                            Spacer()
                        }
                        
                        ForEach(0..<10){ index in // The Content Post View
                            NavigationLink(destination: PostContentView() ){
                                SimpleConetentPostView()
                            }
                        }
                        
                        
                    }
                    
                    
                }
                
            }
            .navigationBarTitle("Enlighten Me")
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
