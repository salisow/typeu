///
//  OrderView.swift
//  tipeu
//  typeu
//  Created by Saliou Sow on 20/03/2023.
//  Copyright © 2023 with Swift. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                        .foregroundColor(.mint)
                        .font(.subheadline)
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Commande") {
                        CheckoutView()
                    }
                    .font(.callout)
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}


