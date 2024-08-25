//
//  RoutineListView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/23/24.
//

import SwiftUI

struct RoutineListView: View {
    
    @ObservedObject var routineListViewModel: RoutineListViewModel
    
    var body: some View {
        CustomNavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Routine Schedule이 없는 경우
                    // Routine Schedule이 있는 경우
                    routineCardListView()
                }
            }
            .customNavigationBarItems(title: "Routine List",
                                      useBackButton: false,
                                      options: [])
        }
       
    }
    
    @ViewBuilder
    private func routineCardListView() -> some View {
        
        ForEach(routineListViewModel.routines) { routine in
            RoutineCardView(title: routine.title,
                            completedInfo: "\(routine.completedUnitCount) / \(routine.totalUnitCount)",
                            status: "test")

        }
    }
}

#Preview {
    RoutineListView(routineListViewModel: RoutineListViewModel(routines: []))
}
