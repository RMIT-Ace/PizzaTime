//
//  ContentView.swift
//  PizzaTime
//
//  Created by ace on 19/2/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var selectTomato: Bool = false
    @State private var selectCheese: Bool = false
    @State private var selectMushroom: Bool = false
    @State private var selectedColor: Color = .blue
    @State private var orderDate: Date = Date()
    @State private var numberOfServing: Double = 1.0

    var body: some View {
        NavigationStack {
            VStack {
                orderHeader()
                orderForm()
            }
            .padding()
        }
    }
    
    fileprivate func placeOrderButtonSection() -> some View {
        return Section(header:
                        HStack {
            Spacer()
            NavigationLink(destination: OrderSummaryView()) {
                Text("Place Order")
                    .foregroundStyle(.white)
                    .background(Color("AceCoolBlue"))
            }
            Spacer()
        }
        ) { }
            .padding()
//            .background(.blue)
            .background(Color("AceCoolBlue"))
            .clipShape(Capsule())
    }
    
    @ViewBuilder
    func orderForm() -> some View {
        Form {
            
            Section(header: Text("Your Name for the Order")) {
                TextField("Your name", text: $userName)
            }
            Section(header: Text("Your pizza toppings")) {
                Toggle("Tomato", isOn: $selectTomato)
                Toggle("Cheese", isOn: $selectCheese)
                Toggle("Mushroom", isOn: $selectMushroom)
            }
            Section {
                ColorPicker(
                    "The color of your pizza box",
                    selection: $selectedColor
                )
            }
            Section(header: Text("Date for your order")) {
                DatePicker("Order's Date", selection: $orderDate)
            }
            Section(header: Text("Number of servings (\(Int(numberOfServing)))")) {
                Slider(value: $numberOfServing, in: 1...20, step: 1)
            }
            
            placeOrderButtonSection()
    

        }
    }
    
    @ViewBuilder
    func orderHeader() -> some View {
        Text("🍕")
            .font(.system(size: 100, weight: .bold))
        Text("It's Pizza Time")
            .font(.system(size: 32, weight: .bold))
    }
}

#Preview {
    ContentView()
}
