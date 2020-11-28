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

class AnimeFaceUploadData: ObservableObject, Codable{
    enum CodingKeys: CodingKey{
        case captions, title, isPrivate, imageParms, tags
    }
    @Published var captions = ""
    @Published var title = ""
    @Published var isPrivate = false
    @Published var imageParms:[Double] = setupFaceCreatingUrlParms()
    @Published var tags:[String] = ["", "", ""]
    
    init(){}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        captions = try container.decode(String.self, forKey: .captions)
        title = try container.decode(String.self, forKey: .title)
        isPrivate = try container.decode(Bool.self, forKey: .isPrivate)
        imageParms = try container.decode([Double].self, forKey: .imageParms)
        tags = try container.decode([String].self, forKey: .tags)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(captions, forKey: .captions)
        try container.encode(title, forKey: .title)
        try container.encode(isPrivate, forKey: .isPrivate)
        try container.encode(imageParms, forKey: .imageParms)
        try container.encode(tags, forKey: .tags)
    }
}
