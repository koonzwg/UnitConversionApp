//
//  ContentView.swift
//  UnitConversionApp
//
//  Created by William Koonz on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var outputValue: Double {
        let inputDistance = Double(inputValue) ?? 0.0
        let baseUnitDistance: Double
        
        switch inputUnit {
        case "kilometers":
            baseUnitDistance = inputDistance * 1000
        case "feet":
            baseUnitDistance = inputDistance * 0.3048
        case "yards":
            baseUnitDistance = inputDistance * 0.9144
        case "miles":
            baseUnitDistance = inputDistance * 1609.34
        default:
            baseUnitDistance = inputDistance
        }
        
        let outputDistance: Double
        
        switch outputUnit {
        case "kilometers":
            outputDistance = baseUnitDistance / 1000
        case "feet" :
            outputDistance = baseUnitDistance / 0.3048
        case "yards" :
            outputDistance = baseUnitDistance / 0.9144
        case "miles" :
            outputDistance = baseUnitDistance / 1609.34
        default:
            outputDistance = baseUnitDistance
        }
        return outputDistance
    }
    
    
    
    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Input")) {
                        HStack {
                            TextField("Enter a value", text: $inputValue)
                                .keyboardType(.decimalPad)
                            
                            Text(inputUnit)
                        }
                        
                        Picker("Input Unit", selection: $inputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Output")) {
                        HStack {
                            Text("\(outputValue, specifier: "%.2f")")
                            
                            Text(outputUnit)
                        }
                        
                        Picker("Output Unit", selection: $outputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                .navigationBarTitle("Unit Conversion")
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
