//
//  AllCategoryView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct AllCategoryView: View {

    let categories:[EventCategoryTitle] = [
        .init(id: 1, name: .allEvents),
        .init(id: 2, name: .design),
        .init(id: 3, name: .music),
        .init(id: 4, name: .tech),
        .init(id: 5, name: .entertainment)

    ]
   
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:-20){
                ForEach(categories, id:(\.id)){ category in
                    CategoryView(categorySelected: false, categories: category)
                    
                    
                }
                
                
            }
        }
    }
}

#Preview {
    AllCategoryView()
}

