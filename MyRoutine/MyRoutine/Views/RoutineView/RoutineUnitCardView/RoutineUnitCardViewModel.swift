//
//  RoutineUnitCardViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 7/3/24.
//

import Foundation

class RoutineUnitCardViewModel: ObservableObject {
    @Published var routineUnit: RoutineUnit
    var timer: Timer?
    
    init(routineUnit: RoutineUnit) {
        self.routineUnit = routineUnit
    }
    
    func toggleRoutineUnitSelected() {
        routineUnit.isSelected.toggle()
    }
    
    func toggleCompleteTask() {
        routineUnit.targetTask.isCompleted.toggle()
    }
    
    func inactivateCompleteTask() {
        routineUnit.targetTask.isCompleted = false
    }
    
    func increaseCountTask() {
        if var counterTask = routineUnit.targetTask as? CounterTask {
            counterTask.increase()
            routineUnit.targetTask = counterTask
            
        }
        
    }
    
    func decreaseCountTask() {
        if var counterTask = routineUnit.targetTask as? CounterTask {
            counterTask.decrease()
            routineUnit.targetTask = counterTask
        }
    }
    
    func resetCounterTask() {
        if var counterTask = routineUnit.targetTask as? CounterTask {
            counterTask.reset()
            routineUnit.targetTask = counterTask
        }
    }
    
    func startTimerTask() {
        if var timerTask = routineUnit.targetTask as? TimerTask {
            timerTask.isProgress = true
            self.routineUnit.targetTask = timerTask

            let scheduledTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                timerTask.run()
                self.routineUnit.targetTask = timerTask
            }
            
            if let timer = timer {
                timer.invalidate()
            }
            
            timer = scheduledTimer
        }
    }
    
    func pauseTimerTask() {
        if var timerTask = routineUnit.targetTask as? TimerTask {
            
            if let timer = timer {
                timer.invalidate()
            }
            
            timerTask.pause()
            routineUnit.targetTask = timerTask
        }
    }
    
    func stopTimerTask() {
        if var timerTask = routineUnit.targetTask as? TimerTask {
            
            if let timer = timer {
                timer.invalidate()
            }
            
            timerTask.stop()
            routineUnit.targetTask = timerTask
        }
    }
    
    func startStopWatchTask() {
        if var stopWatchTask = routineUnit.targetTask as? StopWatchTask {
            stopWatchTask.isProgress = true
            self.routineUnit.targetTask = stopWatchTask

            
            let scheduledTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                stopWatchTask.run()
                self.routineUnit.targetTask = stopWatchTask
            }
            
            if let timer = timer {
                timer.invalidate()
            }
            
            timer = scheduledTimer
        }
    }
    
    func pauseStopWatchTask() {
        if var stopWatchTask = routineUnit.targetTask as? StopWatchTask {
            
            if let timer = timer {
                timer.invalidate()
            }
            
            stopWatchTask.pause()
            routineUnit.targetTask = stopWatchTask
        }
    }
    
    func stopStopWatchTask() {
        if var stopWatchTask = routineUnit.targetTask as? StopWatchTask {
            
            if let timer = timer {
                timer.invalidate()
            }
            
            stopWatchTask.stop()
            routineUnit.targetTask = stopWatchTask
        }
    }
    
    func pauseTask() {
        pauseTimerTask()
        pauseStopWatchTask()
    }
    
    func stopTask() {
        resetCounterTask()
        stopTimerTask()
        stopStopWatchTask()
        inactivateCompleteTask()
    }
}
