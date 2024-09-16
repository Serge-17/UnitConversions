//
//  ContentView.swift
//  UnitConversions
//
//  Created by Serge Eliseev on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var conversion = ["метр", "километр", "фут", "ярд", "миля"]
    @State private var inputLength = "метр"
    @State private var outLength = "километр"
    
    func checkNumber(_ number: Int, _ inputLength: String, _ outLength: String) -> Double {
        switch (inputLength, outLength) {
        case ("метр", "километр"):
            return Double(number) * 0.001
        case ("метр", "фут"):
            return Double(number) * 3.280839895013123
        case ("метр", "ярд"):
            return Double(number) * 1.0936132983377078
        case ("метр", "миля"):
            return Double(number) * 0.0006213711922373339
            
        case ("километр", "метр"):
            return Double(number) * 1000
        case ("километр", "фут"):
            return Double(number) * 3280.839895013123
        case ("километр", "ярд"):
            return Double(number) * 1093.6132983377079
        case ("километр", "миля"):
            return Double(number) * 0.621371192237334
  
        case ("фут", "метр"):
            return Double(number) * 0.3048
        case ("фут", "километр"):
            return Double(number) * 0.00030480000000000004
        case ("фут", "ярд"):
            return Double(number) * 0.33333333333333337
        case ("фут", "миля"):
            return Double(number) * 0.0001893939393939394
               
        case ("ярд", "метр"):
            return Double(number) * 0.9144
        case ("ярд", "километр"):
            return Double(number) * 0.0009144
        case ("ярд", "фут"):
            return Double(number) * 3
        case ("ярд", "миля"):
            return Double(number) * 0.0005681818181818182
                
        case ("миля", "метр"):
            return Double(number) * 1609.344
        case ("миля", "километр"):
            return Double(number) * 1.609344
        case ("миля", "фут"):
            return Double(number) * 5280
        case ("миля", "ярд"):
            return Double(number) * 1760

        default:
            return 0.0
        }
    }
    
    func nameLength(_ outLength: String) -> String {
        switch outLength{
        case "метр":
            return "метров"
        case "километр":
            return "километров"
        case "фут":
            return "футов"
        case "ярд":
            return "ярдов"
        case "миля":
            return "миль"
        default:
            return ""
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Введите значение"){
                    TextField("Введите значение:", value: $number, format: .number)
                }

                .keyboardType(.decimalPad)
                
                Section("Выберите единицу измерения:"){
                    Picker("Выбирите меру измерения:", selection: $inputLength) {
                        ForEach(conversion, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Какая единица измерения нужна?"){
                    Picker("Выбирите меру измерения:", selection: $outLength) {
                        ForEach(conversion, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Значение после конвертации:"){
                    Text("\(String(format: "%.2f", checkNumber(number, inputLength, outLength))) \(nameLength(outLength))")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
