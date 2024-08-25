//
//  Routine.swift
//  MyRoutine
//
//  Created by 김태성 on 8/23/24.
//

import Foundation

struct Routine: Identifiable {
    
    enum ProgressStatus {
        case progress, pause, stop
    }
    
    // Routine Title
    // Routine Unit의 총 갯수
    // Routine Unit의 완료 갯수
    // Routine 진행 상태 ( 진행중, 진행중지, 진행멈춤)
    
    let id: String = UUID().uuidString
    var title: String
    var routineUnits: [RoutineUnit]
    var status: ProgressStatus
    
    var totalUnitCount: Int {
        return routineUnits.count
    }
    
    var completedUnitCount: Int {
        return routineUnits.filter { unit in
            unit.targetTask.isCompleted == true
        }.count
    }
    
    
}
