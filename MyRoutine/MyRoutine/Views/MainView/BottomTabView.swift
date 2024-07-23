//
//  BottomTabView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/17/24.
//

import SwiftUI

struct BottomTabView: View {
    @ObservedObject private var tabViewModel = TabViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 80) {
                
                Spacer()
                
                Button {
                    tabViewModel.tappedRoutine()
                } label: {
                    Image("icon.active.routine")
                }
                
                NavigationLink(destination: RoutineUnitAddView()) {
                    Image("icon.active.plus")
                }
                
                
                Button {
                    tabViewModel.tappedAnalysis()
                } label: {
                    Image("icon.active.analysis")
                }

                Spacer()
            }
            .frame(height: 100)
            .background(.white)
            .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    BottomTabView()
}
