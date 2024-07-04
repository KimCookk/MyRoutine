//
//  RoutineViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

class RoutineViewModel: ObservableObject {
    @Published var editModeActivate: Bool = false
    
    @Published var routineSummary: RoutineSummary = RoutineSummary()
    @Published var routineUnitCardViewModelList: [RoutineUnitCardViewModel] = [
        RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Todo Routine", isSelected: false, targetTask: TodoTask())),
        RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Counter Routine", isSelected: false, targetTask: CounterTask(targetCount: 5))),
        RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Tip Routine", isSelected: false, targetTask: TodoTask())),
        RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Stop Watch Routine", isSelected: false, targetTask: StopWatchTask(targetTime: 10, remainingTime: 10))),
        RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Timer Routine", isSelected: false, targetTask: TimerTask()))
    ]
    
    func toggleEditModeActivate() {
        editModeActivate.toggle()
        
        if(editModeActivate == false) {
            allRoutineUnitUnSelected()
        } else {
            allPauseTimer()
        }
    }
        
    func allRoutineUnitUnSelected() {
        for index in routineUnitCardViewModelList.indices {
            routineUnitCardViewModelList[index].routineUnit.isSelected = false
        }
    }
    
    func upOrderRoutineUnitSelected() {
        if(editModeActivate) {
            for i in 0..<routineUnitCardViewModelList.count {
                let current = i
                let front = i - 1
                if(front >= 0) {
                    if (routineUnitCardViewModelList[front].routineUnit.isSelected == false
                        && routineUnitCardViewModelList[current].routineUnit.isSelected == true) {
                        routineUnitCardViewModelList.swapAt(front, current)
                    }
                }
            }
        }
    }
    
    func downOrderRoutineUnitSelected() {
        if(editModeActivate) {
            for i in (0..<routineUnitCardViewModelList.count).reversed() {
                let current = i
                let back = i + 1
                if(back < routineUnitCardViewModelList.count) {
                    if (routineUnitCardViewModelList[back].routineUnit.isSelected == false
                        && routineUnitCardViewModelList[current].routineUnit.isSelected == true) {
                        routineUnitCardViewModelList.swapAt(back, current)
                    }
                }
            }
        }
    }
    
    func addRoutineUnit() {
        print("RoutineViewModel addRoutineUnit")
    }
    
    func removeRoutineUnitSelected() {
        routineUnitCardViewModelList = routineUnitCardViewModelList.filter { $0.routineUnit.isSelected == false }
    }
    
    func editRoutineUnitSelected() {
        print("RoutineViewModel editRoutineUnit")
        // TODO: selected가 하나인지 확인 필요
    }
    
    func allPauseTimer() {
        routineUnitCardViewModelList.forEach { viewModel in
            let task = viewModel.routineUnit.targetTask
            
            if var timerTask = task as? TimerTask {
                timerTask.pause()
            } else if var stopwatchTimer = task as? StopWatchTask {
                stopwatchTimer.pause()
            }
        }
    }
}
