//
//  RoutineUnitCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/1/24.
//

import SwiftUI

struct RoutineUnitAddCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray001.opacity(0.4))
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 9)
                        .fill(Color.white)
                        .overlay {
                            HStack {
                                RoutineUnitTypeIconView(type: .counter)
                                
                                Text(RoutineUnitType.counter.typeName)
                            }
                            //.fill(Color.purple002)
                        }
                        .padding(2)
                    
                    RoundedRectangle(cornerRadius: 9)
                        .fill(Color.purple002.opacity(0.4))
                        .padding(2)
                }
                
            }
            .frame(width: 165, height: 68)
            
    }
}

#Preview {
    RoutineUnitAddCardView()
}
