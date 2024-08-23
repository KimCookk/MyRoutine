//
//  RoutineCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/23/24.
//

import SwiftUI

struct RoutineCardView: View {
    
    @State var isRoutineViewActive: Bool = false
    
    var body: some View {
        
        CustomNavigationLink(isActive: $isRoutineViewActive,
                             destination: RoutineView(),
                             label: {
            VStack {
                Text("Routine Title")
                
                Text("20 / 30")
                
                Text("진행중")
            }
            .background(Color.green)
        })
        
        
    }
}

#Preview {
    RoutineCardView()
}
