//
//  RoutineUnitCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

#Preview {
    RoutineUnitCardView(type: .todo)
    
}

#Preview {
    RoutineUnitCardView(type: .counter)
}

struct RoutineUnitCardView: View {
    // View에서 편집 누르면 select 버튼 있어야함
    @State var type: RoutineUnitType
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay {
                HStack(spacing: 16) {
                    RoutineUnitTypeIconView(type: type)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Routine Unit Title")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(NotoSansKRFont(fontStyle: .medium, size: 14).font())
                        
                        RoutineUnitTagCardListView()
                        .frame(height: 24)
                    }
                    
                    RoutineUnitCardOptionView(type: type)
                }
                .padding(16)
            }
            .frame(height: 84)
        
        
    }
}

private struct RoutineUnitTypeIconView: View {
    let type: RoutineUnitType
    
    var body: some View {
        Image(type.iconImageName)
    }
}

/// Routine Tag 리스트
// TODO: 태그들의 width에 따른 갯수 조정이 필요.. scroll view..?
private struct RoutineUnitTagCardListView: View {
    var body: some View {
        HStack(spacing: 8) {
            RoutineUnitTagCardView(tag: "Personal", styleColor: Color.gray)
            
            RoutineUnitTagCardView(tag: "Workout", styleColor: Color.orange)
            
            Spacer()
        }
    }
}




