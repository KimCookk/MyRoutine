//
//  RoutineUnitCardOptionView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

#Preview {
    RoutineUnitCardOptionView(viewModel: RoutineViewModel(),
                              index: 1)
}

struct RoutineUnitCardOptionView: View {
    @ObservedObject var viewModel: RoutineViewModel
    
    let index: Int
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            switch viewModel.routineUnitList[index].targetTask.type {
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
            
            Toggle(isOn: $viewModel.routineUnitList[index].targetTask.isCompleted) {
                Image(viewModel.routineUnitList[index].targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .toggleStyle(.button)
            .frame(width: 15, height: 15)
            .accentColor(.clear)
        }
        
    }
    
    @ViewBuilder
    private func timerTypeOptionView() -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnitList[index].targetTask.taskContent)
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
                    viewModel.startTimerTask(for: index)
                }
            } label: {
                Image("icon.active.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseTimerTask(for: index)
                }
            } label: {
                Image("icon.active.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    // TODO: 초기화 여부 알럿을 띄운다.
                    viewModel.stopTimerTask(for: index)
                }
            } label: {
                Image("icon.active.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.toggleCompleteTaks(for: index,
                                                 type: .timer)
                }
            } label: {
                Image(viewModel.routineUnitList[index].targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    @ViewBuilder
    private func stopWatchTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnitList[index].targetTask.taskContent)
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
                    viewModel.startStopWatchTask(for: index)
                }
            } label: {
                Image("icon.active.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.pauseStopWatchTask(for: index)
                }
            } label: {
                Image("icon.active.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    // TODO: 초기화 여부 알럿을 띄운다.
                    viewModel.stopStopWatchTask(for: index)
                }
            } label: {
                Image("icon.active.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            
            Button {
                withAnimation(.spring) {
                    viewModel.toggleCompleteTaks(for: index,
                                                 type: .stopWatch)
                }
            } label: {
                Image(viewModel.routineUnitList[index].targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    @ViewBuilder
    private func counterTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnitList[index].targetTask.taskContent)
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
                    viewModel.increaseCountTask(for: index)
                }
            } label: {
                Image("icon.active.plus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.decreaseCountTask(for: index)
                }
            } label: {
                Image("icon.active.minus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(viewModel.routineUnitList[index].targetTask.isCompleted)
            
            Button {
                withAnimation(.spring) {
                    viewModel.routineUnitList[index].targetTask.isCompleted.toggle()
                }
            } label: {
                Image(viewModel.routineUnitList[index].targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
}


