//
//  AboutProjectLinkView.swift
//  EnlightenMe
//
//  Created by Vincent He on 2020-11-24.
//

import SwiftUI

// This will be how the navigation link will look like in the first page
// There will be another one that is in to more detail
struct AboutProjectLinkView: View {
    private var Data:AboutProjectLinkData
    init(Data: AboutProjectLinkData){
        self.Data = Data
    }
    
    var body: some View {
        VStack{            
            Image(Data.imageName).resizable()
                .frame(width: 500/3, height: 400/3)
            
            
            Text(Data.projectName)
                .font(.headline)
                .multilineTextAlignment(.center)
                
            
        }
    }
}

struct AboutProjectLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AboutProjectLinkView(Data: getAboutProjectLinkData()[0])
    }
}
