//
//  OtherPeopleProfileView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-26.
//

import SwiftUI

struct OtherPeopleProfileView: View {
    @State private var userName = "Mr.Random"
    @State private var Followers = Int.random(in: 0..<10000)
    @State private var numOfPosts = Int.random(in: 0..<10000)
    @State private var Following = Int.random(in: 0..<10000)
    @State private var placeHolderValue = 10
    
    @State var accountId = 1 // This may change in the future
    
    @State private var posts:AllContentPostViewData?
    @State private var sortedImagesURL:[[String]] = [[String]]()
    @State private var sortedData:[[ContentPostViewData]] = [[ContentPostViewData]]()
    
    var body: some View {
        VStack{
            ScrollView{
                HStack{ // About Him Page
                    VStack{
                        Image("ProfilePicture-PlaceHolder").resizable().frame(width:75, height: 75).clipShape(Circle()).padding()
                        Text("\(userName)")
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("Follower\n\(Followers)")
                        .multilineTextAlignment(.center)
                    Spacer()
                    Text("Posts\n\(numOfPosts)")
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    Text("Following\n\(Following)")
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                Divider() // Dividing against user to post
                
                ForEach(0..<sortedImagesURL.count, id: \.self){ num in
                    SquareBoxPostView(imageurl: sortedImagesURL[num], data: sortedData[num])
                }
            }
                .navigationBarTitle(userName)
        }.onAppear(perform: getData) // Getting data when ever this is loaded
    }
    
    func getData(){ // Get users posts
        guard let url = URL(string: "\(Constants().domain)/api/get-posts-from-user/\(self.accountId)") else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Hello")
            if let data = data{
                if let posts = try? JSONDecoder().decode(AllContentPostViewData.self, from: data){ // Data model, data input
                    
                    self.posts = posts
                    self.sortedImagesURL = seperate_image_urls(data: posts)
                    self.sortedData = seperate_data_from_data(data: posts)
                }
            }
            print("Hello")
        }.resume()
    }}

struct OtherPeopleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPeopleProfileView()
    }
}
