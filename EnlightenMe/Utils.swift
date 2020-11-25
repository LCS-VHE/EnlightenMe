//
//  Utils.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-24.
//

import Foundation

func getAboutProjectLinkData() -> [AboutProjectLinkData] {
    let image_names = ["AboutProjectLinkView-Placeholder", "Anime-Face-Placeholder"]
    let project_names = ["Neural Styel Transfere", "Anime Face Generator"]
    var result = [AboutProjectLinkData]()
    
    for index in 0..<image_names.count{ // Mergering the list and adding the object
        result.append(AboutProjectLinkData(projectName: project_names[index], imageName:image_names[index]))
    }
    
    return result
    
}
