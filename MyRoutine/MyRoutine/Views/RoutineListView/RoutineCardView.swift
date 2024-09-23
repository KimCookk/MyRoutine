//
//  RoutineCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/23/24.
//

import SwiftUI

struct RoutineCardView: View {
    
    @State var isRoutineViewActive: Bool = false
    
    var title: String
    var completedInfo: String
    var status: String
    
    var body: some View {
        
        CustomNavigationLink(isActive: $isRoutineViewActive,
                             destination: RoutineDetailView(viewModel: RoutineDetailViewModel(routineUnits: [])),
                             label: {
            VStack {
                Text(title)
                
                Text(completedInfo)
                
                Text(status)
            }
            .background(Color.green)
        })
        
        
    }
}

#Preview {
    RoutineCardView(title: "Routine Title",
                    completedInfo: "20 / 30",
                    status: "Progressing")
}
