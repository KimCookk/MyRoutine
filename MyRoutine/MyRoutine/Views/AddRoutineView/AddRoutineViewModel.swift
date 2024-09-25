//
//  RoutineUnitAddViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 7/22/24.
//

import Foundation

class AddRoutineViewModel: ObservableObject  {
    @Published var selectedType: RoutineUnitType = .todo {
        didSet {
            updateTaskForSelectedType()
        }
    }
    
    @Published var routineUnitTask: RoutineUnitTask = TodoTask()
    @Published var title: String = ""
    @Published var tags: [String] = []
    @Published var tipComment: String = ""
    
    var useOptionView: Bool {
        switch(selectedType) {
        case .counter:
            return true
        case .timer:
            return true
        case .stopWatch:
            return false
        case .todo:
            return false
        }
    }
    
    let tagTextFieldPlaceholder: String = "Enter tags"
    
    init() {
        updateTaskForSelectedType()
    }
    
    func updateTaskForSelectedType() {
        switch selectedType {
        case .todo:
            routineUnitTask = TodoTask()
        case .timer:
            routineUnitTask = TimerTask()
        case .stopWatch:
            routineUnitTask = StopWatchTask()
        case .counter:
            routineUnitTask = CounterTask(targetCount: 1)
        }
    }
    
    func updateCounterTaskCount(_ count: Int) {
        if var counterTask = routineUnitTask as? CounterTask {
            counterTask.targetCount = count
            routineUnitTask = counterTask
        }
    }
    
    func updateTimerTaskHours(_ hours: Int) {
        if var timerTask = routineUnitTask as? TimerTask {
            let minutes = timerTask.targetTime.getMinutes()
            let seconds = timerTask.targetTime.getSeconds()
            
            timerTask.targetTime = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
            timerTask.remainingTime = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
            routineUnitTask = timerTask
        }
    }
    
    func updateTimerTaskMinutes(_ minutes: Int) {
        if var timerTask = routineUnitTask as? TimerTask {
            let hours = timerTask.targetTime.getHours()
            let seconds = timerTask.targetTime.getSeconds()
            
            timerTask.targetTime = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
            timerTask.remainingTime = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
            routineUnitTask = timerTask
        }
    }
    
    func updateTimerTaskSeconds(_ seconds: Int) {
        if var timerTask = routineUnitTask as? TimerTask {
            let hours = timerTask.targetTime.getHours()
            let minutes = timerTask.targetTime.getMinutes()
            
            timerTask.targetTime = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
            timerTask.remainingTime = TimeInterval((hours * 3600) + (minutes * 60) + seconds)
            routineUnitTask = timerTask
        }
    }
    
    func getRoutineUnit() -> RoutineUnit {
        registerTags()
        
        return RoutineUnit(title: title,
                           targetTask: routineUnitTask,
                           tags: RoutineUnitTagManager.shared.getTags(tags),
                           tip: tipComment)
    }
    
    func registerTags() {
        if(tags.count > 0 ) {
            RoutineUnitTagManager.shared.appendTags(tags)
        }
    }
}
