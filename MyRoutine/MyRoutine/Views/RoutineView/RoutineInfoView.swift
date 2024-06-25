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
                ForEach(viewModel.routineUnitList) { routineUnit in
                    RoutineUnitCardView(viewModel: viewModel,
                                        isEdited: $viewModel.editModeActivate,
                                        routineUnit: routineUnit)
                }
            }
        }
    }
}




