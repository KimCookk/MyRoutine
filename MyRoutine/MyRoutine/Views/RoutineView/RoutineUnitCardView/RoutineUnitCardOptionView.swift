//
//  RoutineUnitCardOptionView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

#Preview {
    RoutineUnitCardOptionView(viewModel: RoutineViewModel(),
                              routineUnit: RoutineUnit(title: "테스트", isSelected: false, targetTask: CounterTask(targetCount: 15)))
}

struct RoutineUnitCardOptionView: View {
    @ObservedObject var viewModel: RoutineViewModel
    
    let routineUnit: RoutineUnit
    
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
            
            if routineUnit.tip != nil   {
                IconButton(activeIconName: "icon.active.tip") {
                    
                }
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            IconButton(activeIconName: "icon.active.check",
                       inactiveIconName: "icon.inactive.check",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }
            })
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
            
            if routineUnit.tip != nil   {
                IconButton(activeIconName: "icon.active.tip") {
                    
                }
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            
            IconButton(activeIconName: "icon.active.play",
                       inactiveIconName: "icon.inactive.play",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    
                }
            })
            
            IconButton(activeIconName: "icon.active.pause",
                       inactiveIconName: "icon.inactive.pause",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                   
                }
            })
            
            IconButton(activeIconName: "icon.active.stop",
                       inactiveIconName: "icon.inactive.stop",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    // stop 클릭시 반드시 초기화 여부를 묻는다
                }
            })
            
            IconButton(activeIconName: "icon.active.check",
                       inactiveIconName: "icon.inactive.check",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }
            })
        }
    }
    
    @ViewBuilder
    private func stopWatchTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text("00:42:21")
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if routineUnit.tip != nil   {
                IconButton(activeIconName: "icon.active.tip") {
                    
                }
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            IconButton(activeIconName: "icon.active.play",
                       inactiveIconName: "icon.inactive.play",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    
                }
            })
            
            IconButton(activeIconName: "icon.active.pause",
                       inactiveIconName: "icon.inactive.pause",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                   
                }
            })
            
            IconButton(activeIconName: "icon.active.stop",
                       inactiveIconName: "icon.inactive.stop",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    // stop 클릭시 반드시 초기화 여부를 묻는다
                }
            })
            
            IconButton(activeIconName: "icon.active.check",
                       inactiveIconName: "icon.inactive.check",
                       isActivate: false,
                       onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }
            })
        }
    }
    
    @ViewBuilder
    private func counterTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text(routineUnit.targetTask.taskContent)
                .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if routineUnit.tip != nil   {
                IconButton(activeIconName: "icon.active.tip") {
                    
                }
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            IconButton(activeIconName: "icon.active.plus") {
                withAnimation(.spring) {
                    viewModel.increaseCountTask(for: routineUnit)
                }
            }
            
            IconButton(activeIconName: "icon.active.minus") {
                withAnimation(.spring) {
                    viewModel.decreaseCountTask(for: routineUnit)
                }
            }
            
            IconButton(activeIconName: "icon.active.check",
                       inactiveIconName: "icon.inactive.check",
                       isActivate: routineUnit.targetTask.isCompleted,
                       onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }
            })
        }
    }
}


