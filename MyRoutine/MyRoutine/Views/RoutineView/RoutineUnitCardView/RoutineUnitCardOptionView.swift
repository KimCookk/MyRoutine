//
//  RoutineUnitCardOptionView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

//#Preview {
//    RoutineUnitCardOptionView(viewModel: RoutineViewModel(),
//                              index: 1)
//}

struct RoutineUnitCardOptionView: View {
    @ObservedObject var viewModel: RoutineUnitCardViewModel
    @ObservedObject var routineViewModel: RoutineViewModel
    
    @State private var isShowingStopCheckAlert = false
    
    private var isActiveTip: Bool {
        return !viewModel.routineUnit.tipComment.isEmpty && routineViewModel.routineSummary.isProgress
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            switch viewModel.routineUnit.targetTask.type {
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
                    if(isActiveTip) {
                        viewModel.isSheetPresented = true
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
                    routineViewModel.toggleRoutineUnitViewModel(viewModel)
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress && viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
        
    }
    
    @ViewBuilder
    private func timerTypeOptionView() -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnit.targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(routineViewModel.routineSummary.isProgress ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            
            Button {
                withAnimation(.spring) {
                    if(isActiveTip) {
                        viewModel.isSheetPresented = true
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
                    viewModel.startTimerTask()
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.play" : "icon.inactive.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseTimerTask()
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.pause" : "icon.inactive.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                isShowingStopCheckAlert = true
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.stop" : "icon.inactive.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            .alert("메시지", isPresented: $isShowingStopCheckAlert) {
                Button("OK") {
                    withAnimation(.spring) {
                        viewModel.stopTimerTask()
                    }
                }
                
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("해당 루틴 진행이 초기화됩니다. 정말 정지하시겠습니까?")
            }
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseTimerTask()
                    routineViewModel.toggleRoutineUnitViewModel(viewModel)                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress && viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    @ViewBuilder
    private func stopWatchTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnit.targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(routineViewModel.routineSummary.isProgress ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            Button {
                withAnimation(.spring) {
                    if(isActiveTip) {
                        viewModel.isSheetPresented = true
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
                    viewModel.startStopWatchTask()
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.play" : "icon.inactive.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseStopWatchTask()
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.pause" : "icon.inactive.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    isShowingStopCheckAlert = true
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.stop" : "icon.inactive.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            .alert("메시지", isPresented: $isShowingStopCheckAlert) {
                Button("OK") {
                    withAnimation(.spring) {
                        viewModel.stopStopWatchTask()
                    }
                }
                
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("해당 루틴 진행이 초기화됩니다. 정말 정지하시겠습니까?")
            }
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseStopWatchTask()
                    routineViewModel.toggleRoutineUnitViewModel(viewModel)                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress && viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    @ViewBuilder
    private func counterTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnit.targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .foregroundColor(routineViewModel.routineSummary.isProgress ? Color.black001 : Color.purple001)
                .lineLimit(1)
            
            Button {
                withAnimation(.spring) {
                    if(isActiveTip) {
                        viewModel.isSheetPresented = true
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
                    viewModel.increaseCountTask()
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.plus" : "icon.inactive.plus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.decreaseCountTask()
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress ? "icon.active.minus" : "icon.inactive.minus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    routineViewModel.toggleRoutineUnitViewModel(viewModel)
                }
            } label: {
                Image(routineViewModel.routineSummary.isProgress && viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
}


