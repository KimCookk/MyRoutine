//
//  MainView.swift
//  MyRoutine
//
//  Created by 김태성 on 5/21/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            RoutineView()
            
            BottomTabView()
        }
    }
}

#Preview {
    MainView()
}
