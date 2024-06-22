//
//  RoutineInfoView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

// TODO: Empty Vieweh 생각해야함
struct RoutineInfoView: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Routine")
                    .font(NotoSansKRFont(fontStyle: .medium, size: 20).font())
                
                Spacer()
            }
            
            RoutineUnitCardListView()
            
            Spacer()
        }
    }
}

#Preview {
    RoutineInfoView()
}

private struct RoutineUnitCardListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                RoutineUnitCardView(type: .todo)
                
                RoutineUnitCardView(type: .counter)
                
                RoutineUnitCardView(type: .tip)
                
                RoutineUnitCardView(type: .stopWatch)
                
                RoutineUnitCardView(type: .timer)
            }
        }
    }
}




