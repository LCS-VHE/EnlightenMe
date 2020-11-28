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

class AnimeFaceUploadData: ObservableObject{
    @Published var captions = ""
    @Published var title = ""
    @Published var isPrivate = false
    @Published var imageParms:[Double] = setupFaceCreatingUrlParms()
    @Published var tags:[String] = ["", "", ""]
}
