//
//  CategoryView.swift
//  eventsAU
//
//  Created by Swan Nay Phue Aung on 25/12/2023.
//

import SwiftUI

struct CategoryView: View {
    
    
    @State var categorySelected:Bool
    
    var categories:EventCategoryTitle
    

    var body: some View {
        Button(action: {
            categorySelected.toggle()
        }) {
            RoundedRectangle(cornerRadius: 50)
                .padding()
                .frame(width:170,height:85)
                .bold()
                .font(.system(size:20))
                .foregroundColor(categorySelected ? .black : .white)
                .overlay(
                    Text("\(categories.name.rawValue)"))
                .foregroundColor(categorySelected ? .white : .black)
            
            
        }
    }
}
#Preview {
    CategoryView(categorySelected: false, categories: .init(id: 1, name: .allEvents))
}

