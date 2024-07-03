//
//  RoutineViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

class RoutineViewModel: ObservableObject {
    @Published var editModeActivate: Bool = false
//    @Published var routineUnitList: [RoutineUnit] = [
//        RoutineUnit(title: "Todo Routine", isSelected: false, targetTask: TodoTask()),
//        RoutineUnit(title: "Counter Routine", isSelected: false, targetTask: CounterTask(targetCount: 5)),
//        RoutineUnit(title: "Tip Routine", isSelected: false, targetTask: TodoTask()),
//        RoutineUnit(title: "Stop Watch Routine", isSelected: false, targetTask: StopWatchTask(targetTime: 10, remainingTime: 10)),
//        RoutineUnit(title: "Timer Routine", isSelected: false, targetTask: TimerTask())
//    ]
    
    @Published var routineUnitCardViewModelList: [RoutineUnitCardViewModel] = [
        RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Todo Routine", isSelected: false, targetTask: TodoTask())),
        //RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Counter Routine", isSelected: false, targetTask: CounterTask(targetCount: 5))),
        //RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Tip Routine", isSelected: false, targetTask: TodoTask())),
        //RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Stop Watch Routine", isSelected: false, targetTask: StopWatchTask(targetTime: 10, remainingTime: 10))),
        //RoutineUnitCardViewModel(routineUnit: RoutineUnit(title: "Timer Routine", isSelected: false, targetTask: TimerTask()))
    ]
    
    func toggleEditModeActivate() {
        editModeActivate.toggle()
        
        if(editModeActivate == false) {
            allRoutineUnitUnSelected()
        } else {
            allPauseTimer()
        }
    }
    
    func deleteRoutineUnitSelected() {
        routineUnitCardViewModelList = routineUnitCardViewModelList.filter { $0.routineUnit.isSelected == false }
    }
    
//    func toggleRoutineUnitCompleted(for routine: RoutineUnit) {
//        if let index = routineUnitList.firstIndex(where: { $0.id == routine.id }) {
//            routineUnitList[index].targetTask.isCompleted.toggle()
//        }
//    }
    
//    func toggleRoutineUnitSelected(for routine: RoutineUnit) {
//        if(editModeActivate) {
//            if let index = routineUnitList.firstIndex(where: { $0.id == routine.id }) {
//                routineUnitList[index].isSelected.toggle()
//            }
//        }
//    }
    
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
    
//    func toggleCompleteTaks(for index: Int, type: RoutineUnitType) {
//        let search = routineUnitList[index]
//        
//        var task = search.targetTask
//       
//        switch(type) {
//            case .counter: break
//            case .stopWatch:
//                self.pauseStopWatchTask(for: index)
//                break
//            case .timer:
//                self.pauseTimerTask(for: index)
//                break
//            case .todo: break
//        }
//        
//        task.isCompleted.toggle()
//        routineUnitList[index].targetTask = task
//    }
    
//    func increaseCountTask(for index: Int) {
//        let search = routineUnitList[index]
//        
//        if var counterTask = search.targetTask as? CounterTask {
//            counterTask.increase()
//            routineUnitList[index].targetTask = counterTask
//            
//        }
//        
//    }
    
//    func decreaseCountTask(for index: Int) {
//        let search = routineUnitList[index]
//        
//        if var counterTask = search.targetTask as? CounterTask {
//            counterTask.decrease()
//            routineUnitList[index].targetTask = counterTask
//        }
//    }
    
    func allPauseTimer() {
//        timerDictionary.values.forEach { timer in
//            timer.invalidate()
//        }
        routineUnitCardViewModelList.forEach { viewModel in
            let task = viewModel.routineUnit.targetTask
            
            if var timerTask = task as? TimerTask {
                timerTask.pause()
            } else if var stopwatchTimer = task as? StopWatchTask {
                stopwatchTimer.pause()
            }
        }
    }
    
//    func startTimerTask(for index: Int) {
//        let search = routineUnitList[index]
//
//        if var timerTask = search.targetTask as? TimerTask {
//            let unitID = search.id
//            
//            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//                timerTask.run()
//                self.routineUnitList[index].targetTask = timerTask
//            }
//            
//            timerDictionary.updateValue(timer, forKey: unitID)
//        }
//    }
    
//    func pauseTimerTask(for index: Int) {
//        let search = routineUnitList[index]
//
//        if var timerTask = search.targetTask as? TimerTask {
//            let unitID = search.id
//            timerDictionary[unitID]?.invalidate()
//            
//            timerTask.pause()
//            routineUnitList[index].targetTask = timerTask
//        }
//    }
    
//    func stopTimerTask(for index: Int) {
//        let search = routineUnitList[index]
//
//        if var timerTask = search.targetTask as? TimerTask {
//            let unitID = search.id
//            timerDictionary[unitID]?.invalidate()
//            
//            timerTask.stop()
//            routineUnitList[index].targetTask = timerTask
//        }
//    }
    
//    func startStopWatchTask(for index: Int) {
//        let search = routineUnitList[index]
//
//        if var stopWatchTask = search.targetTask as? StopWatchTask {
//            let unitID = search.id
//            
//            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//                stopWatchTask.run()
//                self.routineUnitList[index].targetTask = stopWatchTask
//            }
//            
//            timerDictionary.updateValue(timer, forKey: unitID)
//        }
//    }
    
//    func pauseStopWatchTask(for index: Int) {
//        let search = routineUnitList[index]
//
//        if var stopWatchTask = search.targetTask as? StopWatchTask {
//            let unitID = search.id
//            timerDictionary[unitID]?.invalidate()
//            
//            stopWatchTask.pause()
//            routineUnitList[index].targetTask = stopWatchTask
//        }
//    }
    
//    func stopStopWatchTask(for index: Int) {
//        let search = routineUnitList[index]
//
//        if var stopWatchTask = search.targetTask as? StopWatchTask {
//            let unitID = search.id
//            timerDictionary[unitID]?.invalidate()
//            
//            stopWatchTask.stop()
//            routineUnitList[index].targetTask = stopWatchTask
//        }
//    }
}
