//
//  RoutineView.swift
//  MyRoutine
//
//  Created by 김태성 on 5/21/24.
//

import SwiftUI

struct RoutineView: View {
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 68)
            
            RoutineSummaryView()
                .padding(10)
                
            RoutineInfoView()
                .padding(10)
            
            Spacer()
        }
        .background(Color.background001)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RoutineView()
}

