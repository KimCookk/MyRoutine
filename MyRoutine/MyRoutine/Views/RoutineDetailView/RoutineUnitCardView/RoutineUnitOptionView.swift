//
//  RoutineUnitCardOptionView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

#Preview {
    RoutineUnitOptionView(viewModel: RoutineDetailViewModel(routineUnits: [dummyToDoRoutine]), unitID: dummyToDoRoutine.id)
}

struct RoutineUnitOptionView: View {
    @ObservedObject var viewModel: RoutineDetailViewModel
    
    @State private var isShowingStopCheckAlert = false
    
    var unitID: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            if let routineUnit = viewModel.getRoutineUnitByID(unitID) {
                switch routineUnit.targetTask.type {
                case .todo:
                    todoTypeOptionView(isActiveTip: viewModel.isActiveTipByRoutineUnit(routineUnit),
                                       isCompleteTask: viewModel.isCompleteTaskByRoutineUnit(routineUnit),
                                       isProgressRoutine: viewModel.isProgressRoutine())
                                       
                case .timer:
                    timerTypeOptionView(content: routineUnit.targetTask.taskContent,
                                        isActiveTip: viewModel.isActiveTipByRoutineUnit(routineUnit),
                                        isCompleteTask: viewModel.isCompleteTaskByRoutineUnit(routineUnit),
                                        isProgressRoutine: viewModel.isProgressRoutine())
                case .stopWatch:
                    stopWatchTypeOptionView(content: routineUnit.targetTask.taskContent,
                                            isActiveTip: viewModel.isActiveTipByRoutineUnit(routineUnit),
                                            isCompleteTask: viewModel.isCompleteTaskByRoutineUnit(routineUnit),
                                            isProgressRoutine: viewModel.isProgressRoutine())
                    
                case .counter:
                    counterTypeOptionView(content: routineUnit.targetTask.taskContent,
                                          isActiveTip: viewModel.isActiveTipByRoutineUnit(routineUnit),
                                          isCompleteTask: viewModel.isCompleteTaskByRoutineUnit(routineUnit),
                                          isProgressRoutine: viewModel.isProgressRoutine())
                }
            }
        }
        .frame(width: 100)
    }
    
    @ViewBuilder
    private func todoTypeOptionView(isActiveTip: Bool,
                                    isCompleteTask: Bool,
                                    isProgressRoutine: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Button {
                withAnimation(.spring) {
                    if(isActiveTip) {
                        // 구현 필요
                        //$viewModel.isSheetPresented = true
                    }
                }
            } label: {
                Image(isActiveTip ? "icon.active.tip" : "icon.inactive.tip")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    // 구현 필요
                    //routineViewModel.toggleRoutineUnitViewModel(viewModel)
                    //viewModel.toggleCompleteTask()
                    //                    routineViewModel.routineUnits[0].targetTask.isCompleted.toggle()
                    // routineViewModel, viewModel 의 routine 상이
                    
                }
            } label: {
                //Image(viewModel.routineSummary.isProgress && routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                Image(isCompleteTask && isProgressRoutine == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
        
    }
    
    @ViewBuilder
    private func timerTypeOptionView(content: String,
                                     isActiveTip: Bool,
                                     isCompleteTask: Bool,
                                     isProgressRoutine: Bool) -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            Text(content)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(isProgressRoutine ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            
            Button {
                withAnimation(.spring) {
                    if(isActiveTip) {
                        // TODO: 구현필요
                        // viewModel.isSheetPresented = true
                    }                }
                } label: {
                    Image(isActiveTip ? "icon.active.tip" : "icon.inactive.tip")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                
            }
            
            HStack(spacing: 10) {
                Spacer()
                
                Button {
                    withAnimation(.spring) {
                        // TODO: 구현필요
                        //viewModel.startTimerTask()
                    }
                } label: {
                    Image(isProgressRoutine ? "icon.active.play" : "icon.inactive.play")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                // TODO: 구현필요
                //.disabled(viewModel.routineUnit.targetTask.isCompleted)
                
                
                Button {
                    withAnimation(.spring) {
                        // TODO: 구현필요
                        //viewModel.pauseTimerTask()
                    }
                } label: {
                    Image(isProgressRoutine ? "icon.active.pause" : "icon.inactive.pause")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                // TODO: 구현필요
                //.disabled(viewModel.routineUnit.targetTask.isCompleted)
                
                Button {
                    isShowingStopCheckAlert = true
                } label: {
                    Image(isProgressRoutine ? "icon.active.stop" : "icon.inactive.stop")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                // TODO: 구현필요
                //.disabled(viewModel.routineUnit.targetTask.isCompleted)
                .alert("메시지", isPresented: $isShowingStopCheckAlert) {
                    Button("OK") {
                        withAnimation(.spring) {
                            // TODO: 구현필요
                            //viewModel.stopTimerTask()
                        }
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("해당 루틴 진행이 초기화됩니다. 정말 정지하시겠습니까?")
                }
                
                Button {
                    withAnimation(.spring) {
                        // TODO: 구현필요
                        //viewModel.pauseTimerTask()
                        //viewModel.toggleRoutineUnitViewModel(viewModel)
                    }
                } label: {
                    Image(isCompleteTask && isProgressRoutine == true ? "icon.active.check" : "icon.inactive.check")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
        }
    
    
    @ViewBuilder
    private func stopWatchTypeOptionView(content: String,
                                         isActiveTip: Bool,
                                         isCompleteTask: Bool,
                                         isProgressRoutine: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(content)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(isProgressRoutine ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            Button {
                withAnimation(.spring) {
                    //                    if(isActiveTip) {
                    //                        // TODO: 구현필요
                    //                        // viewModel.isSheetPresented = true
                    //    }
                }
            } label: {
                //                Image(isActiveTip ? "icon.active.tip" : "icon.inactive.tip")
                //                    .resizable()
                //                    .frame(width: 15, height: 15)
            }
            
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    //viewModel.startStopWatchTask()
                }
            } label: {
                Image(isProgressRoutine ? "icon.active.play" : "icon.inactive.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(isCompleteTask)
            
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    //viewModel.pauseStopWatchTask()
                }
            } label: {
                Image(isProgressRoutine ? "icon.active.pause" : "icon.inactive.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(isCompleteTask)
            
            
            Button {
                withAnimation(.spring) {
                    //isShowingStopCheckAlert = true
                }
            } label: {
                Image(isProgressRoutine ? "icon.active.stop" : "icon.inactive.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(isCompleteTask)
            .alert("메시지", isPresented: $isShowingStopCheckAlert) {
                Button("OK") {
                    withAnimation(.spring) {
                        // TODO: 구현필요
                        // viewModel.stopStopWatchTask()
                    }
                }
                
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("해당 루틴 진행이 초기화됩니다. 정말 정지하시겠습니까?")
            }
            
            
            Button {
                withAnimation(.spring) {
                    //구현 필요
                    //viewModel.pauseStopWatchTask()
                    //routineViewModel.toggleRoutineUnitViewModel(viewModel)
                }
            } label: {
                Image(isProgressRoutine && isCompleteTask == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    
    
    @ViewBuilder
    private func counterTypeOptionView(content: String,
                                       isActiveTip: Bool,
                                       isCompleteTask: Bool,
                                       isProgressRoutine: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(content)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(viewModel.routineSummary.isProgress ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            Button {
                withAnimation(.spring) {
                    //                    if(isActiveTip) {
                    //                        // TODO: 구현필요
                    //                        //viewModel.isSheetPresented = true
                    //                    }
                }
            } label: {
                //                    Image(isActiveTip ? "icon.active.tip" : "icon.inactive.tip")
                //                        .resizable()
                //                        .frame(width: 15, height: 15)
            }
            
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    // viewModel.increaseCountTask()
                }
            } label: {
                Image(isProgressRoutine ? "icon.active.plus" : "icon.inactive.plus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(isCompleteTask)
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    // viewModel.decreaseCountTask()
                }
            } label: {
                Image(isProgressRoutine ? "icon.active.minus" : "icon.inactive.minus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            // TODO: 구현필요
            //.disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    //viewModel.toggleRoutineUnitViewModel(viewModel)
                }
            } label: {
                // TODO: 구현필요
                //                Image(viewModel.routineSummary.isProgress && viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                //                    .resizable()
                //                    .frame(width: 15, height: 15)
            }
        }
    }
}

