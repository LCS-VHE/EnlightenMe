//
//  StyleTransfereUtilityView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-12-03.
//

import SwiftUI
import SDWebImageSwiftUI

struct StyleTransfereUtilityView: View {
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    HStack{ // style image and image
                        Spacer()
                        VStack{
                            Text("Image")
                            Button(action:{
                                // Do something
                            }){
                                Text("Upload Image")
                            }
                            
                            Image("Original-Image-StyleTransfere")
                                .resizable()
                                .scaledToFit()
                        }
                        Divider() // Dividing the screen to two parts
                        VStack{
                            Text("Style Image")
                            Button(action:{
                                // Upload style image
                            }){
                                Text("Upload Style Image")
                            }
                            Image("Original-Style-Image")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    Spacer()
                }
                
                Group{
                    Button(action: { // Upload Image and wait for a while
                        
                    }){
                        Text("Show Output ")
                    }
                    Text("Output Image")
                    Image("Output-Image-NeuralStyleTransfere")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                    .navigationBarTitle("Neural Style Transfere")
            }
            
        }
    }
}

struct StyleTransfereUtilityView_Previews: PreviewProvider {
    static var previews: some View {
        StyleTransfereUtilityView()
    }
}
