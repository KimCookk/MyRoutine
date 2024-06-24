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
        RoutineUnit(type: .todo, title: "Todo Routine", isSelected: false, isCompleted: false),
        RoutineUnit(type: .counter, title: "Counter Routine", isSelected: false, isCompleted: false),
        RoutineUnit(type: .tip, title: "Tip Routine", isSelected: false, isCompleted: false),
        RoutineUnit(type: .stopWatch, title: "Stop Watch Routine", isSelected: false, isCompleted: false),
        RoutineUnit(type: .timer, title: "Timer Routine", isSelected: false, isCompleted: false)
    ]
    
    func editeModeButtonClick() {
        editModeActivate.toggle()
    }
}
