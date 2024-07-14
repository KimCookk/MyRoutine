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
                
                editModeView()
            }
            .padding(.horizontal, 10)
            
            RoutineUnitCardListView(viewModel: viewModel)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func editModeView() -> some View {
        HStack(spacing: 12) {
            
            if(viewModel.editModeActivate) {
                
                Button {
                    withAnimation(.spring) {
                        viewModel.upOrderRoutineUnitSelected()
                    }
                } label: {
                    Image("icon.arrow.up")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                
                Button {
                    withAnimation(.spring) {
                        viewModel.downOrderRoutineUnitSelected()
                    }
                } label: {
                    Image("icon.arrow.down")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                
                Button {
                    withAnimation(.spring) {
                        
                    }
                } label: {
                    Image("icon.pencil")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                
                Button {
                    withAnimation(.spring) {
                        viewModel.removeRoutineUnitSelected()
                    }
                } label: {
                    Image("icon.trash")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
            
            Button {
                withAnimation(.spring) {
                    viewModel.toggleEditModeActivate()
                }
            } label: {
                Image("icon.menu.dots")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
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
                if(viewModel.routineUnitCardViewModelList.isEmpty) {
                    emptyCardListView()
                } else {
                    routineUnitCardListView()
                }
            }
        }
    }
    
    @ViewBuilder
    private func routineUnitCardListView() -> some View {
        ForEach(viewModel.routineUnitCardViewModelList.indices, id: \.self) { index in
            RoutineUnitCardView(routineViewModel: viewModel,
                                viewModel: viewModel.routineUnitCardViewModelList[index],
                                editModeActivate: $viewModel.editModeActivate,
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




