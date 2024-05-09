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
    @State var result: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
            Text("Meses")
            TextField("E quantos meses além disso ele tem", value: $months, format: .number)
            Text("Porte")
            //aqui vai o segmented control
            
            
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            }
            else {
                Image(ImageResource.clarinha)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 150)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            
            Button("Cãocular") {
                print("cãocular")
                result = 23
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .bold()
            
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
