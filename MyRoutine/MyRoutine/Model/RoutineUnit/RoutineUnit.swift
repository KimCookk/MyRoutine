//
//  RoutineUnit.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

struct RoutineUnit: Identifiable {
    let id: String
    var title: String
    var isSelected: Bool
    var targetTask: RoutineUnitTask
    var tip: RoutineUnitTip?
    
    init(id: String = UUID().uuidString, title: String, isSelected: Bool, targetTask: RoutineUnitTask, tip: RoutineUnitTip? = nil) {
        self.id = id
        self.title = title
        self.isSelected = isSelected
        self.targetTask = targetTask
        self.tip = tip
    }
}

protocol RoutineUnitTask {
    var isCompleted: Bool { get set }
    var type: RoutineUnitType { get }
    
    init()
}

struct TodoTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .todo
    }
    
    init() {
        isCompleted = false
    }
}

struct TimerTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .timer
    }
    
    var targetTime: TimeInterval?
    var elapsedTime: TimeInterval?

    init() {
        isCompleted = false
        targetTime = nil
        elapsedTime = nil
    }
}

struct StopWatchTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .stopWatch
    }
    
    var targetTime: TimeInterval?
    var remainingTime: TimeInterval?
    
    init() {
        isCompleted = false
        targetTime = nil
        remainingTime = nil
    }
}

struct CounterTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .counter
    }
    
    var targetCount: Int
    var currentCount: Int
   
    init() {
        isCompleted = false
        targetCount = 0
        currentCount = 0
    }
    
    mutating func increase() {
        if(targetCount > currentCount) {
            currentCount += 1
            if(currentCount == targetCount) {
                isCompleted = true
            }
        }
    }
    
    mutating func decrease() {
        if(currentCount > 0) {
            currentCount -= 1
        }
    }
}

struct RoutineUnitTip {
    var tipComment: String
}

