//
//  RoutineViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

class RoutineViewModel: ObservableObject {
    @Published var editModeActivate: Bool = false
    @Published var routineUnitList: [RoutineUnit] = [
//        RoutineUnit(type: .todo, title: "Todo Routine", isSelected: false, isCompleted: false),
//        RoutineUnit(type: .counter, title: "Counter Routine", isSelected: false, isCompleted: false),
//        RoutineUnit(type: .tip, title: "Tip Routine", isSelected: false, isCompleted: false),
//        RoutineUnit(type: .stopWatch, title: "Stop Watch Routine", isSelected: false, isCompleted: false),
//        RoutineUnit(type: .timer, title: "Timer Routine", isSelected: false, isCompleted: false)
    ]
    
    func toggleEditModeActivate() {
        editModeActivate.toggle()
        
        if(editModeActivate == false) {
            allRoutineUnitUnSelected()
        }
    }
    
    func deleteRoutineUnitSelected() {
        routineUnitList = routineUnitList.filter { $0.isSelected == false }
    }
    
    func toggleRoutineUnitCompleted(for routine: RoutineUnit) {
        if let index = routineUnitList.firstIndex(where: { $0.id == routine.id }) {
            routineUnitList[index].isCompleted.toggle()
        }
    }
    
    func toggleRoutineUnitSelected(for routine: RoutineUnit) {
        if(editModeActivate) {
            if let index = routineUnitList.firstIndex(where: { $0.id == routine.id }) {
                routineUnitList[index].isSelected.toggle()
            }
        }
    }
    
    func allRoutineUnitUnSelected() {
        for index in routineUnitList.indices {
            routineUnitList[index].isSelected = false
        }
    }
    
    func upOrderRoutineUnitSelected() {
        if(editModeActivate) {
            for i in 0..<routineUnitList.count {
                let current = i
                let front = i - 1
                if(front >= 0) {
                    if (routineUnitList[front].isSelected == false
                        && routineUnitList[current].isSelected == true) {
                        routineUnitList.swapAt(front, current)
                    }
                }
            }
        }
    }
    
    func downOrderRoutineUnitSelected() {
        if(editModeActivate) {
            for i in (0..<routineUnitList.count).reversed() {
                let current = i
                let back = i + 1
                if(back < routineUnitList.count) {
                    if (routineUnitList[back].isSelected == false
                        && routineUnitList[current].isSelected == true) {
                        routineUnitList.swapAt(back, current)
                    }
                }
            }
        }
    }
    
    func addRoutineUnit() {
        print("RoutineViewModel addRoutineUnit")
    }
    
}
