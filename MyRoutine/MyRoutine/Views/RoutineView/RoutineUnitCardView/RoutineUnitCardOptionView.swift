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
    
    let index: Int
    
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
                    
                }
            } label: {
                Image("icon.active.tip")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    viewModel.toggleCompleteTask()
                }
            } label: {
                Image(viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
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
                .lineLimit(1)
            
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.tip")
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
                Image("icon.active.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseTimerTask()
                }
            } label: {
                Image("icon.active.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    // TODO: 초기화 여부 알럿을 띄운다.
                    viewModel.stopTimerTask()
                }
            } label: {
                Image("icon.active.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseTimerTask()
                    viewModel.toggleCompleteTask()
                }
            } label: {
                Image(viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
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
                .lineLimit(1)
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.tip")
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
                Image("icon.active.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseStopWatchTask()
                }
            } label: {
                Image("icon.active.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    // TODO: 초기화 여부 알럿을 띄운다.
                    viewModel.stopStopWatchTask()
                }
            } label: {
                Image("icon.active.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseStopWatchTask()
                    viewModel.toggleCompleteTask()
                }
            } label: {
                Image(viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
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
                .lineLimit(1)
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.tip")
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
                Image("icon.active.plus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.decreaseCountTask()
                }
            } label: {
                Image("icon.active.minus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnit.targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.toggleCompleteTask()
                }
            } label: {
                Image(viewModel.routineUnit.targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
}


