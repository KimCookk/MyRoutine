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
    var isSelected: Bool = true;
    var isEdited: Bool = true;
    var isCompleted: Bool = true;
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay {
                ZStack {
                   if(isEdited) {
                        ZStack {
                            GeometryReader { geo in
                                Circle()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.purple001)
                                    .padding(.leading, 6)
                                    .padding(.top, 6)
                                    
                            }
                            
                            if(isSelected) {
                                GeometryReader { geo in
                                    Circle()
                                        .frame(width: 9, height: 9)
                                        .foregroundColor(Color.gray003)
                                        .padding(.leading, 8.5)
                                        .padding(.top, 8.5)
                                        
                                }
                            }
                        }
                    }
                   
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
                    
                    if(isCompleted) {
                        GeometryReader { geo in
                            Color.black001.opacity(0.4)
                        }
                        .cornerRadius(10)
                        .allowsHitTesting(false)
                    }

                }
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




