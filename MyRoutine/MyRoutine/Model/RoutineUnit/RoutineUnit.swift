//
//  RoutineUnit.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

struct RoutineUnit: Identifiable {
    let id: String
    let type: RoutineUnitType
    var title: String
    var isSelected: Bool
    var targetTask: RoutineUnitTask
    
    init(id: String = UUID().uuidString, type: RoutineUnitType, title: String, isSelected: Bool, targetTask: RoutineUnitTask) {
        self.id = id
        self.type = type
        self.title = title
        self.isSelected = isSelected
        self.targetTask = targetTask
    }
}

protocol RoutineUnitTask {
    var isCompleted: Bool { get set }
    init()
    
}

struct TodoTask: RoutineUnitTask {
    var isCompleted: Bool
    
    init() {
        isCompleted = false
    }
}

struct TipTask: RoutineUnitTask {
    var isCompleted: Bool
    var tip: String?
    
    init() {
        isCompleted = false
        tip = nil
    }
}

struct TimerTask: RoutineUnitTask {
    var isCompleted: Bool
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


