//
//  RoutineInfoView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

// TODO: Empty View 생각해야함
struct RoutineInfoView: View {
    @ObservedObject var viewModel: RoutineViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Routine")
                    .font(NotoSansKRFont(fontStyle: .medium, size: 20).font())
                
                Spacer()
            }
            .padding(.horizontal, 10)
            
            RoutineUnitCardListView(viewModel: viewModel)
            
            Spacer()
        }
    }
}

//#Preview {
//    RoutineInfoView()
//}

private struct RoutineUnitCardListView: View {
    @ObservedObject var viewModel: RoutineViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if(viewModel.routineUnitList.isEmpty) {
                    emptyCardListView()
                } else {
                    routineUnitCardListView()
                }
            }
        }
    }
    
    @ViewBuilder
    private func routineUnitCardListView() -> some View {
        ForEach(viewModel.routineUnitList.indices, id: \.self) { index in
            RoutineUnitCardView(viewModel: viewModel,
                                index: index)
                                //isEdited: $viewModel.editModeActivate,
                                
        }
    }
    
    @ViewBuilder
    private func emptyCardListView() -> some View {
        EmptyRoutineUnitCardView(viewModel: viewModel)
//RoutineUnitCardView(viewModel: viewModel,
//                            routineUnit: nil)
    }
    
}




