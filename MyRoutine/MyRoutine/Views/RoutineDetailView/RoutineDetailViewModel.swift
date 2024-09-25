//
//  RoutineViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

class RoutineDetailViewModel: ObservableObject {
    @Published var isEditingEnabled: Bool = false
    @Published var titleActivate: Bool = false
    
    @Published var routineSummary: RoutineSummary = RoutineSummary()
    @Published var routineUnitCardViewModelList: [RoutineUnitViewModel] =
    [
        RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Todo Routine",
                                                      targetTask: TodoTask(),
                                                      tags: [RoutineUnitTagManager.shared.getTag("Work"), RoutineUnitTagManager.shared.getTag("Project")])),
        RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Counter Routine",
                                                      targetTask: CounterTask(targetCount: 5),
                                                      tags: [RoutineUnitTagManager.shared.getTag("Programming"), RoutineUnitTagManager.shared.getTag("Weekly")])),
        RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Tip Routine",
                                                      targetTask: TodoTask(),
                                                      tags: [RoutineUnitTagManager.shared.getTag("Shared")])),
        RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Stop Watch Routine",
                                                      targetTask: StopWatchTask(),
                                                      tags: [RoutineUnitTagManager.shared.getTag("Test"),RoutineUnitTagManager.shared.getTag("Community"),RoutineUnitTagManager.shared.getTag("Shared"), RoutineUnitTagManager.shared.getTag("Programming")])),
        RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Timer Routine", targetTask: TimerTask(targetTime: 10, remainingTime: 10))),
        RoutineUnitViewModel(routineUnit: RoutineUnit(title: "Timer Routine", targetTask: TimerTask(targetTime: 10, remainingTime: 10)))
    ]
    @Published var routineUnits: [RoutineUnit]
    @Published var selectedRoutineUnitIds: [String] = []
    
    @Published var isAllCompleteRoutineUnit: Bool = false
    @Published var isRoutineAddViewActive: Bool = false
    
    @Published var updatedRoutineID: String = ""
    
    @Published var isShowingStopCheckAlert: Bool = false
    
    var summaryTimer: Timer?
    
    init(routineUnits: [RoutineUnit]) {
        self.routineUnits = routineUnits
    }
    
    func isEmptyRoutineUnits() -> Bool {
        return self.routineUnits.isEmpty
    }
    
    func isSelectedRoutineUnit(for unitID: String) -> Bool {
        return self.selectedRoutineUnitIds.contains(unitID)
    }
    
    func toggleEditModeActivate() {
        isEditingEnabled.toggle()
        
        if(isEditingEnabled == false) {
            allRoutineUnitUnSelected()
        } else {
            //allPauseTimer()
        }
    }
    
    func activeTitleActivate() {
        titleActivate = true
    }
    
    func inactiveTitleActivate() {
        titleActivate = false
    }
    
    func toggleSelectedRotuineUnit(for unitID: String) {
        if(selectedRoutineUnitIds.contains(unitID)) {
            selectedRoutineUnitIds.removeAll { id in
                return id == unitID
            }
        } else {
            selectedRoutineUnitIds.append(unitID)
        }
    }
    
    func allRoutineUnitUnSelected() {
        selectedRoutineUnitIds.removeAll()
    }
    
    func upOrderRoutineUnitSelected() {
        if(isEditingEnabled) {
            for i in 0..<routineUnits.count {
                let current = i
                let front = i - 1
                if(front >= 0) {
                    let currentRoutineUnitID = routineUnits[current].id
                    let frontRoutineUnitID = routineUnits[front].id
                    
                    if (self.isSelectedRoutineUnit(for: frontRoutineUnitID) == false
                        && self.isSelectedRoutineUnit(for: currentRoutineUnitID) == true) {
                        routineUnits.swapAt(front, current)
                    }
                }
            }
        }
    }
    
    func downOrderRoutineUnitSelected() {
        if(isEditingEnabled) {
            for i in (0..<routineUnits.count).reversed() {
                let current = i
                let back = i + 1
                if(back < routineUnits.count) {
                    let currentRoutineUnitID = routineUnits[current].id
                    let backRoutineUnitID = routineUnits[back].id

                    if (self.isSelectedRoutineUnit(for: backRoutineUnitID) == false
                        && self.isSelectedRoutineUnit(for: currentRoutineUnitID) == true) {
                        routineUnits.swapAt(back, current)
                    }
                }
            }
        }
    }
    
    func addRoutineUnit(_ routineUnit: RoutineUnit) {
        //routineUnitCardViewModelList.append(RoutineUnitViewModel(routineUnit: routineUnit))
        routineUnits.append(routineUnit)
        updatedRoutineID = routineUnit.id
    }
    
    func getRoutineUnitByID(_ id: String) -> RoutineUnit? {
        return routineUnits.first { routineUnit in
            routineUnit.id == id
        }
    }
    
    func removeRoutineUnitSelected() {
        routineUnits = routineUnits.filter {
            self.isSelectedRoutineUnit(for: $0.id) == false
        }
    }
    
    func copySelectedRoutineUnit() {
        let copyRoutineUnits = routineUnits.filter {
            self.isSelectedRoutineUnit(for: $0.id) == true
        }.map {
            $0.copy()
        }
        
        if(copyRoutineUnits.count > 0) {
            routineUnits.append(contentsOf: copyRoutineUnits)
            updatedRoutineID = copyRoutineUnits[copyRoutineUnits.count - 1].id
        }
    }
    
    func editRoutineUnitSelected() {
        print("RoutineViewModel editRoutineUnit")
        // TODO: selected가 하나인지 확인 필요
    }
    
    func startSummaryTimer() {
        if(isEmptyRoutineUnits() == false) {
            routineSummary.isProgress = true
            
            let scheduledTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.routineSummary.run()
            }
            
            if let summaryTimer = summaryTimer {
                summaryTimer.invalidate()
            }
            
            summaryTimer = scheduledTimer
        } else {
            
        }
    }
    
    func puaseSummaryTimer() {
        if let summaryTimer = summaryTimer {
            summaryTimer.invalidate()
        }
        
        routineSummary.pause()
    }
    
    func stopSummaryTimer() {
        if let summaryTimer = summaryTimer {
            summaryTimer.invalidate()
        }
        
        routineSummary.stop()
    }
    
    func allPauseTimer() {
        routineUnitCardViewModelList.indices.forEach { index in
            let viewModel = routineUnitCardViewModelList[index]
            let task = viewModel.routineUnit.targetTask
            
            if var _ = task as? TimerTask {
                viewModel.pauseTimerTask()
                routineUnitCardViewModelList[index] = viewModel
            } else if var _ = task as? StopWatchTask {
                viewModel.pauseStopWatchTask()
                routineUnitCardViewModelList[index] = viewModel
            }
        }
    }
    
    func allResetTask() {
        routineUnitCardViewModelList.indices.forEach { index in
            let viewModel = routineUnitCardViewModelList[index]
            let task = viewModel.routineUnit.targetTask
            
            if var _ = task as? TimerTask {
                viewModel.stopTimerTask()
            } else if var _ = task as? StopWatchTask {
                viewModel.stopStopWatchTask()
            } else if var _ = task as? CounterTask {
                viewModel.resetCounterTask()
            }
            viewModel.inactivateCompleteTask()
            
            routineUnitCardViewModelList[index] = viewModel
            
        }
    }
    
    func toggleRoutineUnitViewModel(_ routineUnitViewModel: RoutineUnitViewModel) {
        var allCompleted = true
        
        routineUnitCardViewModelList.forEach { viewModel in
            if(viewModel.routineUnit == routineUnitViewModel.routineUnit) {
                viewModel.toggleCompleteTask()
            }
            
            if(!viewModel.isCompleted()) {
                allCompleted = false
            }
        }
        
        if(allCompleted) {
            isAllCompleteRoutineUnit = true
        }
    }
    
    func toggleCompletedRoutineUnitID(_ unitID: String) {
        var routineUnit = routineUnits.first { routineUnit in
            return routineUnit.id == unitID
        }
        
        if var routineUnit = routineUnit {
            routineUnit.targetTask.isCompleted.toggle()
        }
    }
    
    func routineUnitByID(_ unitID: String) -> RoutineUnit {
        var routineUnit = routineUnits.first { routineUnit in
            return routineUnit.id == unitID
        }
        
        if let routineUnit = routineUnit {
            return routineUnit
        }
        
        return RoutineUnit(title: "", targetTask: TodoTask())
    }
    
//    func toggleSelection(for unitID: String) {
//        if let index = routineUnits.firstIndex(where: { $0.id == unitID }) {
//            routineUnits[index].isSelected = true
//        }
//    }
}


