//
//  DummyData.swift
//  MyRoutine
//
//  Created by 김태성 on 6/11/24.
//

import Foundation

let testTabs: [TabBarItem] = [.home, .favorite, .profile]

let dummyTitles = ["test", "test2", "test3", "test4", "test5", "test6", "test7"]

let dummyRoutines = [DummyRoutine(title: "test1", isDrag: false),
                    DummyRoutine(title: "test2", isDrag: false),
                    DummyRoutine(title: "test3", isDrag: false),
                    DummyRoutine(title: "test4", isDrag: false),
                    DummyRoutine(title: "test5", isDrag: false),
                    DummyRoutine(title: "test6", isDrag: false),
                    DummyRoutine(title: "test7", isDrag: false)]

struct DummyRoutine: Hashable, Equatable {
    var title: String
    var isDrag: Bool
    
    mutating func activateDrag() {
        isDrag = true;
    }
    
    mutating func inactivateDrag() {
        isDrag = false;
    }
}
