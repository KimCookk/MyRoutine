//
//  RoutineListViewModel.swift
//  MyRoutine
//
//  Created by 김태성 on 8/25/24.
//

import Foundation

class RoutineListViewModel: ObservableObject {
    @Published var routines: [Routine]
    
    init(routines: [Routine]) {
        self.routines = routines
    }
}
