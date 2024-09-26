//
//  RoutineSummary.swift
//  MyRoutine
//
//  Created by 김태성 on 7/4/24.
//

import Foundation

class RoutineSummary: Identifiable {
    
    let id: String
    var title: String
    var isProgress: Bool
    var elapsedTime: TimeInterval
    
    var summaryContent: String {
        return elapsedTime.getFormattedString("HH:mm:ss")
    }
    
    init(id: String = UUID().uuidString,
         title: String = "",
         isProgress: Bool = false,
         elapsedTime: TimeInterval = 0) {
        self.id = id
        self.title = title
        self.isProgress = isProgress
        self.elapsedTime = elapsedTime
    }
    
    func run() {
        elapsedTime += 1
        if(isProgress != true) {
            isProgress = true
        }
    }
    
    func pause() {
        if(isProgress != false) {
            isProgress = false
        }
    }
    
    func stop() {
        elapsedTime = 0
        if(isProgress != false) {
            isProgress = false
        }
    }

}
