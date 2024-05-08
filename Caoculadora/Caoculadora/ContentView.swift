//
//  ContentView.swift
//  Caoculadora
//
//  Created by Lara Vieira Luchi on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int?
    @State var months: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
            Text("Meses")
            TextField("E quantos meses além disso ele tem", value: $months, format: .number)
              
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
