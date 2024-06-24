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
    var isCompleted: Bool
    
    
    init(id: String = UUID().uuidString, type: RoutineUnitType, title: String, isSelected: Bool, isCompleted: Bool) {
        
        self.id = id
        self.type = type
        self.title = title
        self.isSelected = isSelected
        self.isCompleted = isCompleted
    }
}
