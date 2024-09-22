//
//  RoutineUnitTask.swift
//  MyRoutine
//
//  Created by 김태성 on 9/22/24.
//

import Foundation

protocol RoutineUnitTask {
    var isCompleted: Bool { get set }
    
    var type: RoutineUnitType { get }
    var taskContent: String { get }
}

struct TodoTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .todo
    }
    
    var taskContent: String {
        return ""
    }
    
    init() {
        isCompleted = false
    }
}

struct StopWatchTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .stopWatch
    }

    var isProgress: Bool
    var elapsedTime: TimeInterval

    
    var taskContent: String {
        return elapsedTime.getFormattedString("HH:mm:ss")
    }
    
    init() {
        isCompleted = false
        isProgress = false
        elapsedTime = TimeInterval()
    }
    
    mutating func run() {
        elapsedTime += 1
        if(isProgress != true) {
            isProgress = true
        }
    }
    
    mutating func pause() {
        if(isProgress != false) {
            isProgress = false
        }
    }
    
    mutating func stop() {
        elapsedTime = 0
        if(isProgress != false) {
            isProgress = false
        }
    }
}

struct TimerTask: RoutineUnitTask {
    var isCompleted: Bool
    var type: RoutineUnitType {
        return .timer
    }
    
    var isProgress: Bool
    var targetTime: TimeInterval
    var remainingTime: TimeInterval
    
    var taskContent: String {
        return remainingTime.getFormattedString("HH:mm:ss")
    }
    
    init() {
        isCompleted = false
        isProgress = false
        targetTime = TimeInterval()
        remainingTime = TimeInterval()
    }
    
    init(targetTime: TimeInterval, remainingTime: TimeInterval) {
        self.isCompleted = false
        self.isProgress = false
        self.targetTime = targetTime
        self.remainingTime = remainingTime
    }
    
    mutating func run() {
        if(remainingTime > 0) {
            remainingTime -= 1
            
            if(isProgress != true) {
                isProgress = true
            }
        } else if(remainingTime == 0) {
            isCompleted = true
            isProgress = false
        }
    }
    
    mutating func pause() {
        if(isProgress != false) {
            isProgress = false
        }
    }
    
    mutating func stop() {
        remainingTime = targetTime
        if(isProgress != false) {
            isProgress = false
        }
    }
}

struct CounterTask: RoutineUnitTask {
    var isCompleted: Bool
    
    var type: RoutineUnitType {
        return .counter
    }
    var taskContent: String {
        return "\(currentCount) / \(targetCount)"
    }
    
    var targetCount: Int
    var currentCount: Int
   
    init(isCompleted: Bool = false, targetCount: Int, currentCount: Int = 0) {
        self.isCompleted = isCompleted
        self.targetCount = targetCount
        self.currentCount = currentCount
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
            if(currentCount != targetCount) {
                isCompleted = false
            }
        }
    }
    
    mutating func reset() {
        currentCount = 0
    }
}

