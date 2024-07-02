//
//  RoutineUnitCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

//#Preview {
//    RoutineUnitCardView(type: .todo)
//
//}
//
//#Preview {
//    RoutineUnitCardView(viewModel: RoutineViewModel(), routineUnit: RoutineUnit(title: "Title 이다", isSelected: false, targetTask: CounterTask(targetCount: 15), tip: RoutineUnitTip(tipComment: "팁")))
//}

struct RoutineUnitCardView: View {
    
    @ObservedObject var viewModel: RoutineViewModel
    //@Binding var isEmpty: Bool
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay {
                ZStack {
                    if(viewModel.editModeActivate) {
                        ZStack {
                            GeometryReader { geo in
                                Circle()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.purple001)
                                    .padding(.leading, 6)
                                    .padding(.top, 6)
                                
                            }
                            
                            if(viewModel.routineUnitList[index].isSelected) {
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
                        RoutineUnitTypeIconView(type: viewModel.routineUnitList[index].targetTask.type)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(viewModel.routineUnitList[index].title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(NotoSansKRFont(fontStyle: .medium, size: 14).font())
                            
                            RoutineUnitTagCardListView()
                                .frame(height: 24)
                        }
                        
                        RoutineUnitCardOptionView(viewModel: viewModel,
                                                  index: index)
                    }
                    .padding(16)
                    
                    if(viewModel.routineUnitList[index].targetTask.isCompleted) {
                        GeometryReader { geo in
                            Color.black001.opacity(0.4)
                        }
                        .cornerRadius(10)
                        .allowsHitTesting(false)
                    } else {
                        if let task = viewModel.routineUnitList[index].targetTask as? TimerTask {
                            if(task.isProgress) {
                                GeometryReader { geo in
                                    Color.purple002.opacity(0.4)
                                }
                                .cornerRadius(10)
                                .allowsHitTesting(false)
                            }
                        } else if let task = viewModel.routineUnitList[index].targetTask as? StopWatchTask {
                            if(task.isProgress) {
                                GeometryReader { geo in
                                    Color.purple002.opacity(0.4)
                                }
                                .cornerRadius(10)
                                .allowsHitTesting(false)
                            }
                        }
                    }
                }
            }
            .frame(height: 84)
            .onTapGesture {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitSelected(for: viewModel.routineUnitList[index])
                }
            }
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




