//
//  AnimeFaceCreating.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI
import SDWebImageSwiftUI


struct AnimeFaceCreating: View {
    @ObservedObject  var uploadData = AnimeFaceUploadData()
    @State private var num_of_sliders:Double = 0
    @State private var request_url = getAnimeFaceRequestLink(parms: setupFaceCreatingUrlParms())
    
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Welcome To Anime Face Creator")
                Text("Pro tip: double tap to show image")
                
                NavigationLink(destination: UploadAnimeFaceView(uploadData: self.uploadData) ){
                    Text("Share")
                }
                
                WebImage(url:URL(string:self.request_url)).resizable().frame(width:350, height:350)
                
                Button("Show Image"){
                    self.request_url = getAnimeFaceRequestLink(parms: self.uploadData.imageParms)
                }
                ForEach(0..<34/2){num in
                    HStack{
                        Slider(value: $uploadData.imageParms[num * 2], in: -10...10 )
                        Slider(value: $uploadData.imageParms[num * 2 + 1], in: -10...10 )
                        
                    }
                }
                
            }.onTapGesture(count: 2) {
                self.request_url = getAnimeFaceRequestLink(parms: uploadData .imageParms)
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
