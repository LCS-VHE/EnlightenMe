//
//  UploadAnimeFaceView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct UploadAnimeFaceView: View {
    @State var upload_text = "Write a Caption"
    @State var title = "Write a title"
    @State private var isPrivate = false
    @State var imageParms:[Double] = []
    @State private var tags:[String] = ["", "", ""]
    
    
    var body: some View {
        VStack{
            
            HStack{ // Writing title and body
                WebImage(url:URL(string: getAnimeFaceRequestLink(parms: setupFaceCreatingUrlParms()))).resizable().frame(width:95, height:95)
                Spacer()
                VStack{
                    TextField("Enter a title.....", text:$title)
                    Divider() // Divide two different textfield
                    TextField("Enter captinos:.....", text:$upload_text)
                }
            }
            Divider()
            
            HStack{ // Is This Private
                Text("Private? ").padding()
                Spacer()
                Toggle(isOn: $isPrivate){
                    Text("")
                }
            }
            
            Divider()
            
            VStack{ // For user to enter a list of tags
                List{ // A maximum of 3 tags
                    TextField("First Tag .....", text:$tags[0])
                    TextField("Second Tag .....", text:$tags[1])
                    TextField("Thrid Tag .....", text:$tags[2])
                }
            }
            
//            // Showing a list of tags
//            VStack{ // For Debugging
//                Text("\(tags[0]), \(tags[1]), \(tags[2])")
//            }
        
        Spacer() // Pushing the view to the top
            .navigationBarTitle("New Post")
            .navigationBarItems(trailing:
                                    Button("Upload") { // Uploading the anime Face View
                                        _ = uploadAnimeFace()
                                    }
            )
    }
}
}

struct UploadAnimeFaceView_Previews: PreviewProvider {
    static var previews: some View {
        UploadAnimeFaceView()
    }
}
