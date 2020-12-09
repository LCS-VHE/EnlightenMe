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
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
