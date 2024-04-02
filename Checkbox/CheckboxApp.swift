//
//  CheckboxApp.swift
//  Checkbox
//
//  Created by MD  on 4/1/24.
//

import SwiftUI

@main
struct ContentView: View {
    @State private var isSelected: Bool = false
    var body: some View {
        Text("Accessible Checkbox Example!")
            .accessibilityAddTraits(.isHeader)
            .font(.title)
                VStack {
            
            Toggle(isOn: $isSelected){
                Text("I agree the terms and condition")
                    .padding()
            }
            .toggleStyle(CheckboxToggleStyle())
            .padding()
        }
        .accessibilityElement(children:.contain)

    }
}

struct CheckboxToggleStyle: ToggleStyle{
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack{
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
