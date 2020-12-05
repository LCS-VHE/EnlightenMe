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
                        upload_image() // Upload image to database
                    }){
                        Text("Show Output ")
                    }
                    Text("Output Image")
                    Image(uiImage: self.uploadImage!)
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                    .navigationBarTitle("Neural Style Transfere")
            }
            
        }
    }
        
    func upload_image(){ // Upload Image to database
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
        var urlRequest = URLRequest(url: URL(string: "\(Constants().domain)/upload-image")!)
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
        data.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.jpegData(compressionQuality: 1)!)

        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            
            if(error != nil){
                print("\(error!.localizedDescription)")
            }
            
            guard let responseData = responseData else {
                print("no response data")
                return
            }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                print("uploaded to: \(responseString)")
            }
        }).resume()
        

    }
    
}

struct StyleTransfereUtilityView_Previews: PreviewProvider {
    static var previews: some View {
        StyleTransfereUtilityView()
    }
}
