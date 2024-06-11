//
//  MyRoutineApp.swift
//  MyRoutine
//
//  Created by 김태성 on 5/20/24.
//

import SwiftUI

@main
struct MyRoutineApp: App {
    var body: some Scene {
        WindowGroup {
            RoutineView(items: dummyRoutines)
        }
    }
}
