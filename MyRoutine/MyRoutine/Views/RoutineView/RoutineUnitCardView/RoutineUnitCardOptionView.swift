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
            
            if viewModel.routineUnitList[index].tip != nil   {
                Button {
                    withAnimation(.spring) {
                        viewModel.increaseCountTask(for: index)
                    }
                } label: {
                    Image("icon.active.tip")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
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
    
    //    @ViewBuilder
    //    private func tipTypeOptionView() -> some View {
    //
    //        HStack(spacing: 10) {
    //            Spacer()
    //
    //            ToggleIconView(activeIconName: "icon.active.tip", useToggle: false)
    //
    //        }
    //
    //        HStack(spacing: 10) {
    //            Spacer()
    //
    //            ToggleIconView(activeIconName: "icon.active.check",
    //                           inactiveIconName: "icon.inactive.check",
    //                           onTapped: {
    //                withAnimation(.spring) {
    //                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
    //                }
    //            })
    //        }
    //    }
    
    @ViewBuilder
    private func timerTypeOptionView() -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            Text("00:00:21")
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if viewModel.routineUnitList[index].tip != nil   {
                Button {
                    withAnimation(.spring) {
                        viewModel.increaseCountTask(for: index)
                    }
                } label: {
                    Image("icon.active.tip")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
            Button {
                withAnimation(.spring) {
                    // stop 클릭시 반드시 초기화 여부를 묻는다
                }
            } label: {
                Image("icon.active.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
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
    private func stopWatchTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text("00:42:21")
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if viewModel.routineUnitList[index].tip != nil   {
                Button {
                    withAnimation(.spring) {
                        viewModel.increaseCountTask(for: index)
                    }
                } label: {
                    Image("icon.active.tip")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.play")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
            Button {
                withAnimation(.spring) {
                    
                }
            } label: {
                Image("icon.active.pause")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
            Button {
                withAnimation(.spring) {
                    // stop 클릭시 반드시 초기화 여부를 묻는다
                }
            } label: {
                Image("icon.active.stop")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
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
    private func counterTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(viewModel.routineUnitList[index].targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if viewModel.routineUnitList[index].tip != nil   {
                Button {
                    withAnimation(.spring) {
                        viewModel.increaseCountTask(for: index)
                    }
                } label: {
                    Image("icon.active.tip")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
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
           
            Button {
                withAnimation(.spring) {
                    viewModel.decreaseCountTask(for: index)
                }
            } label: {
                Image("icon.active.minus")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
            Button {
                withAnimation(.spring) {
                    viewModel.routineUnitList[index].targetTask.isCompleted.toggle()
                }
            } label: {
                Image(viewModel.routineUnitList[index].targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
//
//            Toggle(isOn: $viewModel.routineUnitList[index].targetTask.isCompleted) {
//                Image(viewModel.routineUnitList[index].targetTask.isCompleted == true ? "icon.active.check" : "icon.inactive.check")
//                    .resizable()
//                    .frame(width: 15, height: 15)
//            }
//            .toggleStyle(.button)
//            .frame(width: 15, height: 15)
//            .accentColor(.clear)
        }
    }
}


