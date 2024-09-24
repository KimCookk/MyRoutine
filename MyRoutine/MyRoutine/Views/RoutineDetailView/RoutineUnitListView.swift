//
//  RoutineInfoView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

#Preview {
    RoutineUnitListView(viewModel: RoutineDetailViewModel(routineUnits: []))
}

struct RoutineUnitListView: View {
    @ObservedObject var viewModel: RoutineDetailViewModel

    var body: some View {
        ScrollViewReader { value in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    if(viewModel.isEmptyRoutineUnits() == true) {
                        emptyView()
                    } else {
                        unitListView()
                    }
                }
            }
            .onChange(of: viewModel.updatedRoutineID) { routineID in
                withAnimation(.spring) {
                    value.scrollTo(routineID)
                }
            }
        }
    }
    
    @ViewBuilder
    private func unitListView() -> some View {
        ForEach(viewModel.routineUnits) { routineUnit in
            RoutineUnitView(viewModel: viewModel,
                            unitID: routineUnit.id)
        }
        
        Spacer()
            .frame(height: 68)
    }
    
    @ViewBuilder
    private func emptyView() -> some View {
        CustomNavigationLink(isActive: $viewModel.isRoutineAddViewActive,
                             destination: AddRoutineView(routineViewModel: viewModel),
                             label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay {
                    GeometryReader { geo in
                        Image("icon.add.routine")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .offset(x: geo.size.width / 2 - 18, y: geo.size.height / 2 - 18)
                    }
                }
                .frame(height: 84)
        })
    }
}



