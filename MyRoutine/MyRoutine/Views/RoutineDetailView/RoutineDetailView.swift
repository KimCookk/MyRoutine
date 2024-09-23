//
//  RoutineView.swift
//  MyRoutine
//
//  Created by 김태성 on 5/21/24.
//

import SwiftUI

struct RoutineDetailView: View {
    @StateObject var viewModel: RoutineDetailViewModel
    
    var body: some View {
            ZStack {
                VStack {
                    // Routine Progress Timer View
                    RoutineControlView(viewModel: viewModel)
                    
                    RoutineUnitListHeaderView(viewModel: viewModel)
                    
                    RoutineUnitListView(viewModel: viewModel)
                }
                .padding(.horizontal, 20)
            }
            .customNavigationBarItems(title: "Test",
                                      useBackButton: true,
                                      options: [.edit])
            .onChange(of: viewModel.isRoutineAddViewActive) { newValue in
                if(newValue && viewModel.routineSummary.isProgress) {
                    viewModel.puaseSummaryTimer()
                    viewModel.allPauseTimer()
                }
            }
            .alert("메시지", isPresented: $viewModel.isAllCompleteRoutineUnit) {
                Button("OK") {
                    viewModel.puaseSummaryTimer()
                }
            } message: {
                Text("모든 루틴이 진행되었습니다!")
            }
    }
}

#Preview {
    RoutineDetailView(viewModel: RoutineDetailViewModel(routineUnits: []))
}

