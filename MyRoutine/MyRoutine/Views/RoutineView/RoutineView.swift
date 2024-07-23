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
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 68)
                    
                    RoutineSummaryView(viewModel: viewModel)
                    
                    RoutineInfoView(viewModel: viewModel)
                    
//                    Spacer()
                }
                .padding(.horizontal, 20)
                
               BottomTabView()
            }
            .background(Color.background001)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    RoutineView()
}

