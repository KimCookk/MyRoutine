//
//  RoutineUnit.swift
//  MyRoutine
//
//  Created by 김태성 on 6/24/24.
//

import Foundation

class RoutineUnit: Identifiable, Equatable {
    
    static func == (lhs: RoutineUnit, rhs: RoutineUnit) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id: String
    var title: String
    var targetTask: RoutineUnitTask
    var tags: [RoutineUnitTag?]
    var tipComment: String
    
    init(id: String = UUID().uuidString,
         title: String,
         targetTask: RoutineUnitTask,
         tags: [RoutineUnitTag?] = [],
         tip: String = "") {
        
        self.id = id
        self.title = title
        self.targetTask = targetTask
        self.tags = tags
        self.tipComment = tip
    }
    
    func copy(with zone: NSZone? = nil) -> RoutineUnit {
        return RoutineUnit(title: self.title,
                           targetTask: self.targetTask,
                           tags: self.tags,
                           tip: self.tipComment)
    }
}

