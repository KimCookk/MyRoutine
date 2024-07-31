//
//  RoutineView.swift
//  MyRoutine
//
//  Created by 김태성 on 5/21/24.
//

import SwiftUI

struct RoutineView: View {
    @StateObject private var viewModel = RoutineViewModel()
    
    var body: some View {
        
        CustomNavigationView {
            ZStack {
                VStack {
                    
                    RoutineSummaryView(viewModel: viewModel)
                    
                    RoutineInfoView(viewModel: viewModel)
                    
                }
                .padding(.horizontal, 20)
            }
            .customNavigationBarItems(title: "Test",
                                      useBackButton: true,
                                      options: [.edit])
        }

        

    }
}

#Preview {
    RoutineView()
}

