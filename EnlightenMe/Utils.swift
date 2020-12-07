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

func getAnimeFaceRequestLink(parms:[Double]) ->String {
    var url = "\(Constants().domain)/getanimeface?"
    
    for i in 0..<33{
        if i != 32{
            url += "row\(i)=\(parms[i])&"
        }else {
            url += "row\(i)=\(parms[i])"
        }
    }
    return url
}

func setupFaceCreatingUrlParms() -> [Double]{
    var urls = [Double]()
    
    for _ in 0..<34{
        urls.append(0)
    }
    
    return urls
}


func seperate_image_urls(data:AllContentPostViewData) -> [[String]]{
    var results = [[String]]()
    let contentData = data.Posts
    
    for index in 0..<contentData.count/3{
        results.append([contentData[index*3].post_image_url, contentData[index*3 + 1].post_image_url, contentData[index*3 + 2].post_image_url])
    }
    
    return results
}

func seperate_image_urls(data:[ContentPostViewData]) -> [[String]]{
    var results = [[String]]()
    let contentData = data
    
    for index in 0..<contentData.count/3{
        results.append([contentData[index*3].post_image_url, contentData[index*3 + 1].post_image_url, contentData[index*3 + 2].post_image_url])
    }
    
    return results
}

func seperate_data_from_data(data: AllContentPostViewData) -> [[ContentPostViewData]]{
    var results = [[ContentPostViewData]]()
    let contentData = data.Posts
    
    for index in 0..<contentData.count/3{
        results.append([contentData[index * 3], contentData[index*3 + 1], contentData[index*3 + 2]])
    }
    
    return results
}

func seperate_data_from_data(data: [ContentPostViewData]) -> [[ContentPostViewData]]{
    var results = [[ContentPostViewData]]()
    let contentData = data
    
    for index in 0..<contentData.count/3{
        results.append([contentData[index * 3], contentData[index*3 + 1], contentData[index*3 + 2]])
    }
    
    return results
}
