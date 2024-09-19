//
//  RoutineUnitCardOptionView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

#Preview {
    RoutineUnitOptionView(viewModel: RoutineViewModel(routineUnits: [dummyToDoRoutine]), routineUnitID: dummyToDoRoutine.id)
}

struct RoutineUnitOptionView: View {
    @ObservedObject var viewModel: RoutineViewModel
    
    @State private var isShowingStopCheckAlert = false
    
    var routineUnitID: String
    
    private var routineUnit: RoutineUnit {
        viewModel.routineUnitByID(routineUnitID)
    }
    //    private var isActiveTip: Bool {
    //        return !routineUnit.tipComment.isEmpty && viewModel.routineSummary.isProgress
    //    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            switch routineUnit.targetTask.type {
            case .todo:
                todoTypeOptionView()
            case .timer:
                timerTypeOptionView()
            case .stopWatch:
                stopWatchTypeOptionView()
            case .counter:
                counterTypeOptionView()
            }
        }
        .frame(width: 100)
    }
    
    @ViewBuilder
    private func todoTypeOptionView() -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            
            Button {
                withAnimation(.spring) {
                    //                    if(isActiveTip) {
                    //                        // 구현 필요
                    //                        //viewModel.isSheetPresented = true
                    //                    }
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
                    // 구현 필요
                    //routineViewModel.toggleRoutineUnitViewModel(viewModel)
                    //viewModel.toggleCompleteTask()
                    //                    routineViewModel.routineUnits[0].targetTask.isCompleted.toggle()
                    // routineViewModel, viewModel 의 routine 상이
                    
                }
            } label: {
                Image(viewModel.routineSummary.isProgress && routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
        
    }
    
    @ViewBuilder
    private func timerTypeOptionView() -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            Text(routineUnit.targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(viewModel.routineSummary.isProgress ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            
//            Button {
//                withAnimation(.spring) {
//                    //                    if(isActiveTip) {
//                    //                        // TODO: 구현필요
//                    //                        // viewModel.isSheetPresented = true
//                    //                    }                }
//                } label: {
//                    //                Image(isActiveTip ? "icon.active.tip" : "icon.inactive.tip")
//                    //                    .resizable()
//                    //                    .frame(width: 15, height: 15)
//                }
//                
//            }
            
            HStack(spacing: 10) {
                Spacer()
                
                Button {
                    withAnimation(.spring) {
                        // TODO: 구현필요
                        //viewModel.startTimerTask()
                    }
                } label: {
                    Image(viewModel.routineSummary.isProgress ? "icon.active.play" : "icon.inactive.play")
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
                    Image(viewModel.routineSummary.isProgress ? "icon.active.pause" : "icon.inactive.pause")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                // TODO: 구현필요
                //.disabled(viewModel.routineUnit.targetTask.isCompleted)
                
                Button {
                    isShowingStopCheckAlert = true
                } label: {
                    Image(viewModel.routineSummary.isProgress ? "icon.active.stop" : "icon.inactive.stop")
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
                    Image(viewModel.routineSummary.isProgress && routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
        }
    }
    
    @ViewBuilder
    private func stopWatchTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(routineUnit.targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(viewModel.routineSummary.isProgress ? Color.black001 : Color.purple001)
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
                Image(viewModel.routineSummary.isProgress ? "icon.active.play" : "icon.inactive.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    //viewModel.pauseStopWatchTask()
                }
            } label: {
                Image(viewModel.routineSummary.isProgress ? "icon.active.pause" : "icon.inactive.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    isShowingStopCheckAlert = true
                }
            } label: {
                Image(viewModel.routineSummary.isProgress ? "icon.active.stop" : "icon.inactive.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(routineUnit.targetTask.isCompleted)
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
                Image(viewModel.routineSummary.isProgress && routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    
    
    @ViewBuilder
    private func counterTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(routineUnit.targetTask.taskContent)
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
                Image(viewModel.routineSummary.isProgress ? "icon.active.plus" : "icon.inactive.plus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    // TODO: 구현필요
                    // viewModel.decreaseCountTask()
                }
            } label: {
                Image(viewModel.routineSummary.isProgress ? "icon.active.minus" : "icon.inactive.minus")
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
