//
//  RoutineUnitAddViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 7/22/24.
//

import Foundation

class RoutineUnitAddViewModel: ObservableObject  {
    @Published var selectedType: RoutineUnitType = .counter
    @Published var title: String = ""
    @Published var tip: String = ""
    @Published var tags: [String] = []
    
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
}
