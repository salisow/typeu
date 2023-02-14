//
//  CheckoutView.swift
//  tipeu
//
//  typeu
//  Created by Saliou Sow on 20/03/2023.
//  Copyright © 2023 with Swift. All rights reserved.
//


import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "Typeu Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 30, 35,0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add Credit Card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your Typeu ID", text: $loyaltyNumber)
                }
            }
            .font(.headline)
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .foregroundColor(.blue)
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode( .inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            // add finger here
        } message: {
        Text ("Total payment is \(totalPrice) - Thank You for visiting Typeu Store!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}

