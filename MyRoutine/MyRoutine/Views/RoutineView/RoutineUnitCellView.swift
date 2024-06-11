//
//  RoutineUnitCellView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/11/24.
//

import SwiftUI

struct RoutineUnitCellView: View {
    
    @State var routine: DummyRoutine
    
    var body: some View {
        if(routine.isDrag == false) {
            HStack {
                VStack(alignment: .leading) {
                    Text(routine.title)
                        .font(.headline)
                    //.padding(.top, 10)
                    
                    Text("Content")
                        .font(.body)
                    //.padding([.leading, .trailing, .bottom], 10)
                }
                Spacer()
            }
            .frame(height: 80)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
                    .background(.white)
            )
        }
    }
}

#Preview {
    RoutineUnitCellView(routine: DummyRoutine(title: "", isDrag: false))
}
