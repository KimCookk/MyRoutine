//
//  RoutineSummary.swift
//  MyRoutine
//
//  Created by 김태성 on 7/4/24.
//

import Foundation

struct RoutineSummary: Identifiable {
    
    let id: String
    var title: String
    var isProgress: Bool
    var elapsedTime: TimeInterval
    
    init(id: String = UUID().uuidString,
         title: String = "",
         isProgress: Bool = false,
         elapsedTime: TimeInterval = 0) {
        self.id = id
        self.title = title
        self.isProgress = isProgress
        self.elapsedTime = elapsedTime
    }

}
