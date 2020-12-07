//
//  DataStructures.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-24.
//

import SwiftUI

struct AboutProjectLinkData{
    var projectName: String
    var imageName: String
}

struct styleTransferData: Codable {
    var captions:String = ""
    var title:String = ""
    var isPrivate:Bool = false
    var tags:[String] = ["", "", ""]
    var imageLink:String = ""
    var accountId = 1 // Chang in the future
}

class AnimeFaceUploadData: ObservableObject, Codable{
    enum CodingKeys: CodingKey{
        case captions, title, isPrivate, imageParms, tags, accountId
    }
    @Published var captions = ""
    @Published var title = ""
    @Published var isPrivate = false
    @Published var imageParms:[Double] = setupFaceCreatingUrlParms()
    @Published var tags:[String] = ["", "", ""]
    @Published var accountId = 1 // Change in the future to actual accound Id
    
    init(){}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        captions = try container.decode(String.self, forKey: .captions)
        title = try container.decode(String.self, forKey: .title)
        isPrivate = try container.decode(Bool.self, forKey: .isPrivate)
        imageParms = try container.decode([Double].self, forKey: .imageParms)
        tags = try container.decode([String].self, forKey: .tags)
        accountId = try container.decode(Int.self, forKey: .accountId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(captions, forKey: .captions)
        try container.encode(title, forKey: .title)
        try container.encode(isPrivate, forKey: .isPrivate)
        try container.encode(imageParms, forKey: .imageParms)
        try container.encode(tags, forKey: .tags)
        try container.encode(accountId, forKey: .accountId)
    }
    
    func restart(){ // Reseting all paramerters
        
        captions = ""
        title = ""
        isPrivate = false
        imageParms = setupFaceCreatingUrlParms()
        tags = ["", "", ""]
        accountId = 1 // Change in the future to actual accound Id
    }
}

struct AllContentPostViewData : Codable{
    var Posts:[ContentPostViewData]
}

struct TrendingData : Codable{
    var Trending:[ContentPostViewData]
    var Others:[ContentPostViewData]
}

struct ContentPostViewData : Codable{
    var postId:Int
    var accountId:Int
    var timestamp:Int
    var madeWith:String
    var post_image_url:String
    var title:String
    var Captions:String
    var likes:Int
    var isPrivate:Int
}

enum ActiveSheet { // For Showing sheets in the style transfere view
   case first, second, thrid
}
