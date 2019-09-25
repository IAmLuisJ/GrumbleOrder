//
//  CheckOutView.swift
//  GrumbleOrder
//
//  Created by Luis Juarez on 9/24/19.
//  Copyright © 2019 SkyCloud. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    
    static let paymentTypes = ["Cash", "Credit Card", "Reward Points"]
    static let tipAmounts = [10,15,20,25,0]
    
    var body: some View {
        Form {
            Section {
                Picker("How would you like to pay", selection: $paymentType) {
                    ForEach(0..<Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add Rewards Card")
                }
                if addLoyaltyDetails {
                TextField("Enter your Rewards id", text: $loyaltyNumber)
                }
            }
                Section(header: Text("Add a tip?")) {
                    Picker("Percentage", selection: $tipAmount) {
                        ForEach(0..<Self.tipAmounts.count) {
                            Text("\(Self.tipAmounts[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total:")) {
                    Button("Confirm Order") {
                        //place order
                    }
                }
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
