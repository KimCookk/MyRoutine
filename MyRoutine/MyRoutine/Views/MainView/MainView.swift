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
                .padding(.horizontal, 10)
        }
        .background(Color.background001)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MainView()
}
