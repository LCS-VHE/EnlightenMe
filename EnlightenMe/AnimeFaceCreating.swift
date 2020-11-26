//
//  AnimeFaceCreating.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI
import SDWebImageSwiftUI


struct AnimeFaceCreating: View {
    @State private var url_parms = setupFaceCreatingUrlParms()
    //    @State private var num_of_sliders = 34
    @State private var num_of_sliders:Double = 0
    @State private var request_url = getAnimeFaceRequestLink(parms: setupFaceCreatingUrlParms())
    
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Welcome To Anime Face Creator")
                Text("Pro tip: double tap to show image")
                
                WebImage(url:URL(string:self.request_url)).resizable().frame(width:350, height:350)
                
                Button("Show Image"){
                    self.request_url = getAnimeFaceRequestLink(parms: self.url_parms)
                }
                ForEach(0..<34/2){num in
                    HStack{
                        Slider(value: $url_parms[num * 2], in: -10...10 )
                        Slider(value: $url_parms[num * 2 + 1], in: -10...10 )
                        
                    }
                }
                
            }.onTapGesture(count: 2) {
                self.request_url = getAnimeFaceRequestLink(parms: self.url_parms)
            }
        }
        .navigationTitle("Anime Face Creator")
        
        
    }
}

struct AnimeFaceCreating_Previews: PreviewProvider {
    static var previews: some View {
        AnimeFaceCreating()
    }
}
