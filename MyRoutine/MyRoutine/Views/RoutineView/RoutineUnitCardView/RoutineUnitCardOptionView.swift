//
//  RoutineUnitCardOptionView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import SwiftUI

//#Preview {
//    RoutineUnitCardOptionView(type: .timer)
//}

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
                ToggleIconView(activeIconName: "icon.active.tip", useToggle: false)
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            ToggleIconView(activeIconName: "icon.active.check",
                           inactiveIconName: "icon.inactive.check",
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
                .font(RubikFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if routineUnit.tip != nil   {
                ToggleIconView(activeIconName: "icon.active.tip", useToggle: false)
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            ToggleIconView(activeIconName: "icon.active.play", inactiveIconName: "icon.inactive.play")
            ToggleIconView(activeIconName: "icon.active.pause", inactiveIconName: "icon.inactive.pause")
            ToggleIconView(activeIconName: "icon.active.stop", inactiveIconName: "icon.inactive.stop")
            ToggleIconView(activeIconName: "icon.active.check",
                           inactiveIconName: "icon.inactive.check",
                           onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }            })
            // stop 클릭시 반드시 초기화 여부를 묻는다
            
        }
    }
    
    @ViewBuilder
    private func stopWatchTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text("00:42:21")
                .font(RubikFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if routineUnit.tip != nil   {
                ToggleIconView(activeIconName: "icon.active.tip", useToggle: false)
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            ToggleIconView(activeIconName: "icon.active.play", inactiveIconName: "icon.inactive.play")
            ToggleIconView(activeIconName: "icon.active.pause", inactiveIconName: "icon.inactive.pause")
            ToggleIconView(activeIconName: "icon.active.stop", inactiveIconName: "icon.inactive.stop")
            ToggleIconView(activeIconName: "icon.active.check",
                           inactiveIconName: "icon.inactive.check",
                           onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }            })
            // stop 클릭시 반드시 초기화 여부를 묻는다
        }
    }
    
    @ViewBuilder
    private func counterTypeOptionView() -> some View {
        HStack(spacing: 10) {
            Spacer()
            
            Text("0 / 10")
                .font(RubikFont(fontStyle: .bold, size: 12).font())
                .lineLimit(1)
            
            if routineUnit.tip != nil   {
                ToggleIconView(activeIconName: "icon.active.tip", useToggle: false)
            }
        }
        
        HStack(spacing: 10) {
            Spacer()
            
            ToggleIconView(activeIconName: "icon.active.plus", useToggle: false)
            ToggleIconView(activeIconName: "icon.active.minus", useToggle: false)
            ToggleIconView(activeIconName: "icon.active.check",
                           inactiveIconName: "icon.inactive.check",
                           onTapped: {
                withAnimation(.spring) {
                    viewModel.toggleRoutineUnitCompleted(for: routineUnit)
                }            })
            
        }
    }
}


