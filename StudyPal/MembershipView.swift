//
//  MembershipView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 27/04/2023.
//

import SwiftUI



struct MembershipView: View {
    @State private var CardNumber = ""
    @State private var cardOwnerName = ""
    @State private var cardExpirationMonth = 1
    @State private var cardExpirationYear = ""
    @State private var cardCvv = ""
    
    var currentyear: Int {
        let calendar = Calendar.current
        let year = Calendar.current.component(.year, from: Date.now)
        return year}
    var maximumYear: Int {
        let year = currentyear + 10
        return year
    }
    var body: some View {
        VStack(){
            Form{
                Section(header: Text("Card Information")){
                    
                    TextField("Card Number", text: $CardNumber)
                        .keyboardType(.numberPad)
                    TextField("Card Owner Name", text: $cardOwnerName)
                    HStack{
                        Picker("Month", selection: $cardExpirationMonth, content: { ForEach(1..<12) {year in Text("\(year)").tag(DateComponents(year: year))}
                            
                        });
                        
                        Picker("Year", selection: $cardExpirationYear, content: { ForEach(2010..<2030) {year in Text("\(year)").tag(DateComponents(year: year))}
                            
                        })
                        
                    }
                    TextField("CVV", text: $cardCvv)
                        .keyboardType(.numberPad)
                    
                }
                
                
                
            }
            
            Text("Price: 5$/M")
            Button(action:subScribe , label: {Text("Subscribe")})
            
        }
    }
    func subScribe(){}
}

struct MembershipView_Previews: PreviewProvider {
    static var previews: some View {
        MembershipView()
    }
}
