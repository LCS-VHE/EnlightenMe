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
    @State private var Picture_Name = "AboutProjectLinkView-Placeholder"
    
    @State private var ProjectName = "Real Human Face GAN"
    
    var body: some View {
        VStack{            
            Image(Picture_Name).resizable()
                .frame(width: 500/3, height: 400/3)
            
            
            Text(self.ProjectName)
                .font(.headline)
                .multilineTextAlignment(.center)
                
            
            Spacer()
        }
    }
}

struct AboutProjectLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AboutProjectLinkView()
    }
}
