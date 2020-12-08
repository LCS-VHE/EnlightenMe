//
//  StyleTransferShareView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-12-05.
//

import SwiftUI
import SDWebImageSwiftUI

struct StyleTransferShareView: View {
    @State var uploadData = styleTransferData()
    @State private var showAlert = false
    @State private var uploadDataSuccess = false
    var body: some View {
        VStack{
            HStack{// Title and body
                Spacer()
                Text("Share it to the World")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                Button(action:{
                    // Upload Data to the api
                    upload_data_to_endpoint()
                }){
                    Text("Upload")
                }.padding()
            }
            HStack{ // Writing title and body
                WebImage(url:URL(string: uploadData.imageLink)).resizable().frame(width:95, height:95)
                Spacer()
                VStack{
                    TextField("Enter a title.....", text:$uploadData.title)
                    Divider() // Divide two different textfield
                    TextField("Enter captinos:.....", text:$uploadData.captions)
                }
            }
            Divider()
            
            HStack{ // Is This Private
                Text("Private? ").padding()
                Spacer()
                Toggle(isOn: $uploadData.isPrivate){
                    Text("")
                }
            }
            
            Divider()
            
            VStack{ // For user to enter a list of tags
                List{ // A maximum of 3 tags
                    TextField("First Tag .....", text:$uploadData.tags[0])
                    TextField("Second Tag .....", text:$uploadData.tags[1])
                    TextField("Thrid Tag .....", text:$uploadData.tags[2])
                }
            }
            
            Spacer() // Pushing the view to the top
                
                .alert(isPresented: $showAlert) {
                    if uploadDataSuccess{
                        return Alert(title: Text("Important message"), message: Text("Upload Success"), dismissButton: .default(Text("Got it!")))
                    } else {
                        return Alert(title: Text("Important message"), message: Text("Upload Failed"), dismissButton: .default(Text("Got it!")))
                    }
                }
        }
    }
    
    func upload_data_to_endpoint(){
        guard let url = URL(string: "\(Constants().domain)/new-style-post") else {
            return // Cannot convert string to url object
        }
        
        guard let encodedJson = try? JSONEncoder().encode(uploadData) else { // Encoding json data
            return
        }
        var request = URLRequest(url: url) // Requests with the given url
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // HTTP header as json
        request.httpMethod = "POST" // Post requests
        request.httpBody = encodedJson // Body as encoded file
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result here.
            if data != nil{
                guard let unwrapData = String(bytes: data!, encoding: .utf8) else {
                    // When not successs
                    return
                }
                
                showAlert = true
                uploadDataSuccess = true
                print(unwrapData)
                return
            }
        }.resume()
        
        showAlert = true
        uploadDataSuccess = false
        return
        
    }
}

struct StyleTransferShareView_Previews: PreviewProvider {
    static var previews: some View {
        StyleTransferShareView()
    }
}
