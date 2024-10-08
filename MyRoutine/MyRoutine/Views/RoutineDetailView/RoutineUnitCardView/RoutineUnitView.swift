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
//TODO:  Routine Card View Model 확인
// struct로 ... 바라보다보니까.. 전체적으로 검토가 필요할듯
//#Preview {
//    RoutineUnitView(routineViewModel: RoutineViewModel(routineUnits: []),
//                        viewModel: RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Todo Routine",
//                                                                                     isSelected: false,
//                                                                                     targetTask: TodoTask(),
//                                                                                     tags: [RoutineUnitTagManager.shared.getTag("Work"), RoutineUnitTagManager.shared.getTag("Project")])),
//                        editModeActivate: .constant(false),
//                        index: 0)
//}

struct RoutineUnitView: View {
    
    @ObservedObject var viewModel: RoutineDetailViewModel
    
    var unitID: String
    
    var body: some View {
        if let routineUnit = viewModel.getRoutineUnitByID(unitID) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay {
                    ZStack {
                        // 편집 활성화에 대한 View
                        if(viewModel.isEditingEnabled) {
                            ZStack {
                                GeometryReader { geo in
                                    Circle()
                                        .frame(width: 14, height: 14)
                                        .foregroundColor(Color.purple001)
                                        .padding(.leading, 6)
                                        .padding(.top, 6)
                                    
                                }
                                
                                if(viewModel.isSelectedRoutineUnit(for: unitID)) {
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
                        
                        // Routine Unit View
                        HStack(spacing: 16) {
                            // Routine Unit Type의 Icon 영역
                            RoutineUnitTypeIconView(type: routineUnit.targetTask.type)
                            
                            // Routine Unit title, tags 영역
                            VStack(alignment: .leading, spacing: 8) {
                                Text(routineUnit.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(NotoSansKRFont(fontStyle: .medium, size: 14).font())
                                
                                RoutineUnitTagCardListView(tags: routineUnit.tags)
                                    .frame(height: 24)
                            }
                            
                            // Routine Unit Option 영역
                            RoutineUnitOptionView(viewModel: viewModel,
                                                  unitID: unitID)
                        }
                        .padding(16)
                        
                        GeometryReader { geo in
                            if(viewModel.routineSummary.isProgress == false) {
                                Color.black001.opacity(0.1)
                            } else if(routineUnit.targetTask.isCompleted) {
                                Color.black001.opacity(0.4)
                            } else {
                                if let task = routineUnit.targetTask as? TimerTask {
                                    if(task.isProgress) {
                                        Color.purple002.opacity(0.4)
                                    }
                                } else if let task = routineUnit.targetTask as? StopWatchTask {
                                    if(task.isProgress) {
                                        Color.purple002.opacity(0.4)
                                    }
                                }
                            }
                        }
                        .cornerRadius(10)
                        .allowsHitTesting(viewModel.routineSummary.isProgress ? false : true)
                    }
                }
                .frame(height: 84)
                .onTapGesture {
                    withAnimation(.spring) {
                        if(viewModel.isEditingEnabled) {
                            viewModel.toggleSelectedRotuineUnit(for: unitID)
                        }
                    }
                }
            // TODO: 구현필요
            //            .sheet(isPresented: $viewModel.isSheetPresented) {
            //                SheetView(title: viewModel.routineUnit.title,
            //                          content: viewModel.routineUnit.tipComment)
            //            }
        }
    }
}



struct RoutineUnitTypeIconView: View {
    let type: RoutineUnitType
    
    var body: some View {
        Image(type.iconImageName)
    }
}

/// Routine Tag 리스트
// TODO: 태그들의 width에 따른 갯수 조정이 필요.. scroll view..?
private struct RoutineUnitTagCardListView: View {
    let tags: [RoutineUnitTag?]
    
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            HStack(spacing: 8) {
                if(tags.isEmpty) {
                    RoutineUnitTagCardView(tag: "No Tag",
                                           styleColor: Color.black)
                } else {
                    ForEach(tags.indices, id: \.self) { index in
                        if let tag = tags[index] {
                            RoutineUnitTagCardView(tag: tag.name,
                                                   styleColor: Color(hex: tag.styleColorString) ?? Color.white)
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}




