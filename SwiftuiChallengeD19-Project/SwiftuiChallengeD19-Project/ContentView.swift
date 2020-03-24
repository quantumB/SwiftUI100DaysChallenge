//
//  ContentView.swift
//  SwiftuiChallengeD19-Project
//
//  Created by Bernardino Guerrero on 11/02/20.
//  Copyright © 2020 Bernardino Guerrero. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var inputSelected: Temperature = .celsius
    @State private var outputSelected: Temperature = .celsius
    @State private var valueToConvert: String = "0.0"
    var temperatures: [Temperature] = [.celsius, .farenheit, .kelvin]
    var temperature: Double {
        guard let value = Double(valueToConvert) else {
            return 0.0
        }
        return value
    }
    
    var mesurement: Measurement<UnitTemperature> {
        return Measurement(value: temperature, unit: inputSelected.unit)
    }
    
    var result: Measurement<UnitTemperature> {
        return mesurement.converted(to: outputSelected.unit)
    }

    @State private var temperatueToConvert: String = "0.0"
    var body: some View {
        VStack {
            Form {
                Section(header: Text("From")) {
                    TextField("Enter teh value to convert", text: $valueToConvert)
                        .keyboardType(UIKeyboardType.decimalPad)
                    Picker("Select the source", selection: $inputSelected) {
                        ForEach(temperatures, id: \.self) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            
                Section(header: Text("To"), footer: Text("Hola")) {
                    Text("\(result.description)")
                    Picker("Select the output", selection: $outputSelected) {
                        ForEach(temperatures, id: \.self) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
