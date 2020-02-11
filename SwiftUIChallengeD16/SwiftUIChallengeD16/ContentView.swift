//
//  ContentView.swift
//  SwiftUIChallengeD16
//
//  Created by Bernardino Guerrero on 06/02/20.
//  Copyright © 2020 Bernardino Guerrero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = ""
    @State private var tipPercentage = 2
    @State private var numberOfPeople = 2
    
    var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var tipValue: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        return orderAmount / 100 * tipSelection
    }
    
    var orderAmount: Double {
        return Double(checkAmount) ?? 0
    }
    
    var grandTotal: Double {
        return orderAmount + tipValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the amount: ", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$ \(totalPerson, specifier: "%.2f")").foregroundColor(.blue)
                }
                
                Section(header: Text("Total amount for the check")) {
                    Text("$ \(grandTotal, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
