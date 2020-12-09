//
//  StyleTransfereUtilityView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-12-03.
//
// The upload image code is based on https://fluffy.es/upload-image-to-server/#rawhttp


import SwiftUI
import SDWebImageSwiftUI

struct StyleTransfereUtilityView: View {
    @State private var uploadImage = UIImage(named: "Output-Image-NeuralStyleTransfere")
    @State private var styleImage = UIImage(named: "Original-Style-Image")
    @State private var orginialImage = UIImage(named : "Original-Image-StyleTransfere")
    @State private var showSheet = false
    @State private var activeSheet: ActiveSheet = .second
    @State private var outputImageUrl:String = "\(Constants().domain)/file/image/1607221721.313063.jpeg" // Default Image
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Button("Share"){
                        activeSheet = .thrid
                        showSheet = true
                    }.padding()
                    
                    Spacer()
                    Link(destination: URL(string:self.outputImageUrl)!) {
                        Text("Save Image")
                    }.padding()
                }
                Group{
                    HStack{ // style image and image
                        Spacer()
                        VStack{
                            Text("Image")
                            Button(action:{
                                // grab image from photo
                                self.activeSheet = .second // Second is orginial image
                                self.showSheet = true
                            }){
                                Text("Upload Image")
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                            Image(uiImage: orginialImage!)
                                .resizable()
                                .scaledToFit()
                        }
                        Divider() // Dividing the screen to two parts
                        VStack{
                            Text("Style Image")
                            Button(action:{
                                // Upload style image
                                self.activeSheet = .first // First is style image
                                self.showSheet = true
                                
                            }){
                                Text("Upload Style Image")
                                    .multilineTextAlignment(.center)
                            }
                            Image(uiImage: styleImage!)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    Spacer()
                }
                
                Group{
                    Button(action: { // Upload Image and wait for a while
                        upload_image_to_endpoint() // Upload image to database
                    }){
                        Text("Show Output ")
                    }
                    Text("Output Image")
                    WebImage(url:URL(string:outputImageUrl))
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                    .navigationBarTitle("Style Transfere")
            }
            .sheet(isPresented: $showSheet){ // load style imag
                if self.activeSheet == .first{ // Select Style Imag
                    ImagePicker(image: self.$styleImage)
                    
                }else if self.activeSheet == .second{ // Select Orginial Image
                    ImagePicker(image: self.$orginialImage)
                    
                }else{ // Sharing Image View
                    StyleTransferShareView(uploadData: styleTransferData(imageLink: self.outputImageUrl)) // passing data through screen
                }
            }
        }
    }
    
    func upload_image_to_endpoint(){ // Upload Image to database
        guard let image = self.uploadImage else {
            return
            
        }
        
        let filename = "avatar.png"
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        
        let fieldName = "reqtype"
        let fieldValue = "fileupload"
        
        let fieldName2 = "userhash"
        let fieldValue2 = "caa3dce4fcb36cfdf9258ad9c"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: URL(string: "\(Constants().domain)/neural-style-transfere")!)
        urlRequest.httpMethod = "POST"
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Add the reqtype field and its value to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(fieldName)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(fieldValue)".data(using: .utf8)!)
        
        // Add the userhash field and its value to the raw http reqyest data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(fieldName2)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(fieldValue2)".data(using: .utf8)!)
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"style-image\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(styleImage!.jpegData(compressionQuality: 1)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"original-image\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(orginialImage!.jpegData(compressionQuality: 1)!)
        
        
        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            
            if(error != nil){
                print("\(error!.localizedDescription)")
            }
            
            guard let  responseData  = responseData else {
                print("no response data")
                return
            }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                outputImageUrl = responseString
            }
        }).resume()
        
        
    }
}

struct StyleTransfereUtilityView_Previews: PreviewProvider {
    static var previews: some View {
        StyleTransfereUtilityView()
    }
}
