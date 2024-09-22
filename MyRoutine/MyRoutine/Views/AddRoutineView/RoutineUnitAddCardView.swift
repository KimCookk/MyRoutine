//
//  RoutineUnitCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/1/24.
//

import SwiftUI

struct RoutineUnitTypeSelectView: View {
    @Binding var selectedRoutineUnitType: RoutineUnitType
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            HStack {
                Text("Type")
                    .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                
                Spacer()
            }
            
            // Type Cards View
            RoutineUnitTypeCardCollectionView(selectedRoutineUnitType: $selectedRoutineUnitType)
        }
    }
}

struct RoutineUnitAddCardView: View {
    // State에 관해 생각해볼 필요성이 있음.. View 단위로 볼 땐 맞는거 같은데
    // ViewModel과 연결하려면 selectedType이라고 해서 RoutineUnitType 연결하는게 맞지 않을까..?
    let type: RoutineUnitType
    @Binding var state: ButtonState
    
    private var stateColor: Color {
        switch(state) {
        case .normal:
            return .clear
        case .inactivate:
            return .gray001
        case .selected:
            return .purple001
        }
    }
    
    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray001.opacity(0.4))
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 9)
                            .fill(Color.white)
                            .overlay {
                                HStack {
                                    RoutineUnitTypeIconView(type: type)
                                    
                                    Text(type.typeName)
                                        .font(NotoSansKRFont(fontStyle: .medium, size: 15).font())
                                    
                                    Spacer()
                                }
                                .padding(8)
                            }
                            .padding(2)
                        
                        RoundedRectangle(cornerRadius: 9)
                            .fill(stateColor.opacity(0.4))
                            .padding(2)
                    }
                    
                }
                .frame(width: 165, height: 68)
                
    }
}


struct RoutineUnitTypeCardCollectionView: View {
    
    @Binding var selectedRoutineUnitType: RoutineUnitType

    var body: some View {
        VStack {
            HStack {
                RoutineUnitAddCardView(type: .todo,
                                       state: selectedRoutineUnitType == .todo ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    withAnimation(.spring) {
                        selectedRoutineUnitType = .todo
                    }
                }
                
                RoutineUnitAddCardView(type: .counter,
                                       state: selectedRoutineUnitType == .counter ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    withAnimation(.spring) {
                        selectedRoutineUnitType = .counter
                    }
                }
            }
            
            HStack {
                RoutineUnitAddCardView(type: .timer,
                                       state: selectedRoutineUnitType == .timer ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    withAnimation(.spring) {
                        selectedRoutineUnitType = .timer
                    }
                }
                
                RoutineUnitAddCardView(type: .stopWatch,
                                       state: selectedRoutineUnitType == .stopWatch ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    withAnimation(.spring) {
                        selectedRoutineUnitType = .stopWatch
                    }
                }
            }
        }
    }
}

#Preview {
    RoutineUnitAddCardView(type: .counter, state: Binding.constant(.normal))
}
