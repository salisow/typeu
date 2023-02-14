//
//  ItemRow.swift
//
//  typeu
//  Created by Saliou Sow on 20/03/2023.
//  Copyright © 2023 with Swift. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    let colors: [String: Color] = ["D": .blue, "G": .red, "N": .green, "S": .black, "V": .yellow]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}

