//
//  CounterTextField.swift
//  MyRoutine
//
//  Created by 김태성 on 8/13/24.
//

import SwiftUI
import Combine

struct CounterTextField: View {
    @Binding var numberString: String
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            
            VStack {
                TextField(text: $numberString) {
                    Text("1~999 숫자를 입력해주세요.")
                }
                .font(NotoSansKRFont(fontStyle: .bold, size: 20).font())
                .keyboardType(.numberPad)
                .onReceive(Just(numberString)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.numberString = filtered
                    }
                }
                
                Rectangle()
                    .fill(.gray001)
                    .frame(height: 1.5)
            }
           
            Button(action: {
                if let number = Int(numberString) {
                    if(number + 1 <= 999) {
                        numberString = String(number + 1)
                    }
                }
            }) {
                Image("icon.active.plus")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Button(action: {
                if let number = Int(numberString) {
                    if(number - 1 >= 0) {
                        numberString = String(number - 1)
                    }
                }
            }) {
                Image("icon.active.minus")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
        }
        .padding()
    }
}

#Preview {
    CounterTextField(numberString: Binding.constant("0"))
}
