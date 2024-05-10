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
    
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
            Text("Meses")
            TextField("E quantos meses além disso ele tem", value: $months, format: .number)
            Text("Porte")
            
            //aqui vai o segmented control
            Picker("Portes", selection: $porteSelecionado) {
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                }
            }
            .pickerStyle(.segmented)
            Divider()
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                    .foregroundStyle(.indigo)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(maxHeight: 150)
                    .font(.system(size: 50))
            }
            else {
                Image(ImageResource.clarinha)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 150)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 10)
            }
            Spacer()
            Button("Cãocular", action: processYears)
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
    func processYears() {
        print("Cãocular")
        
        guard let years, let months else {
            print("Campos não preenchidos")
            return
        }
        
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero")
            return
        }
        
        // pequeno = *6, médio = *7, grande = *8
        let multiplicador: Int
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        
        result = years * multiplicador + months / 12
    }
}

#Preview {
    ContentView()
}
