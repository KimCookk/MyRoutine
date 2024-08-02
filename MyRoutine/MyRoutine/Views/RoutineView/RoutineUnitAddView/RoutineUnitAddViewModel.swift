//
//  RoutineUnitAddViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 7/22/24.
//

import Foundation

class RoutineUnitAddViewModel: ObservableObject  {
    @Published var selectedType: RoutineUnitType = .todo
    
    @Published var title: String = ""
    @Published var tip: String = ""
    
}
