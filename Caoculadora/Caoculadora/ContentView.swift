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
    @State var porteSelected = Porte.pequeno
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Qual a idade do seu cão?") .font(.header5)
            Text("Anos") .font(.body1)
            TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
            Text("Meses") .font(.body1)
            TextField("E quantos meses além disso ele tem", value: $months, format: .number)
            Text("Porte") .font(.body1)
            
            //aqui vai o segmented control
            Picker("Portes", selection: $porteSelected) {
                ForEach(Porte.allCases, id: \.self) { porte in
                    Text(porte.rawValue)    //rawValue é pra acessar a string do enum
                }
            }
            .pickerStyle(.segmented)
            Divider()
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...") .font(.body1)
                Text("\(result) anos") .font(.display)
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
            Button("Cãocular", action: processYears) .font(.body1)
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
        guard months > 0 || years > 0 else {        //guard é outro instrumento de comparação porém diferente do if
            print("Pelo menos um campo deve ser maior que zero")
            return
        }
        let multiplicador: Int
        switch porteSelected {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        result = years * multiplicador + months / 12
    }
}

#Preview {
    ContentView()
}
