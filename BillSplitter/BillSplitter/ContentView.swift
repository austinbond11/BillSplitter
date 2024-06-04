//
//  ContentView.swift
//  BillSplitter
//
//  Created by Austin Bond on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    // State variables for user inputs and focus management
    @State private var checkAmount = ""
    @State private var checkAmountDouble = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocused: Bool
    
    // Tip percentages options
    let tipPercentages = [0, 10, 15, 20, 25]
    
    // Computed property for total amount including tip
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmountDouble / 100 * tipSelection
        let grandTotal = checkAmountDouble + tipValue
        return grandTotal
    }
    
    // Computed property for amount per person
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmountDouble / 100 * tipSelection
        let grandTotal = checkAmountDouble + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Section for entering bill amount and selecting party size
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .onTapGesture {
                            checkAmount = ""
                            checkAmountDouble = 0.0
                        }
                        .onChange(of: amountIsFocused) { oldValue, newValue in
                            if !newValue {
                                if let amount = Double(checkAmount) {
                                    checkAmountDouble = amount
                                    formatCheckAmountAsCurrency()
                                }
                            }
                        }
                    
                    Picker("Party size:", selection: $numberOfPeople) {
                        ForEach(2..<100) { Text("\($0) people") }
                    }
                } header: {
                    Text("Enter bill amount and party size")
                }
                
                // Section for selecting tip percentage
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select tip amount")
                }
                
                // Section for displaying the grand total
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Grand total")
                }
                
                // Section for displaying the amount per person
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Paid per person")
                        .font(.subheadline)
                        .bold()
                }
            }
            .navigationTitle("Bill Splitter")
            .toolbar {
                // Done button to dismiss the keyboard
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
    // Function to format the check amount as currency
    func formatCheckAmountAsCurrency() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = Locale.current.currency?.identifier ?? "USD"
        checkAmount = formatter.string(from: NSNumber(value: checkAmountDouble)) ?? ""
    }
}

#Preview {
    ContentView()
}
