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
        }
    }
    
    @ViewBuilder
    private func editModeView() -> some View {
        HStack(spacing: 12) {
            if(!viewModel.routineUnitCardViewModelList.isEmpty) {
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
                    
                    // Edit Selected Routine 수정, 단일 Selected 확인 필요
                    Button {
                        withAnimation(.spring) {
                            
                        }
                    } label: {
                        Image("icon.pencil")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    
                    // Copy Selected Routine 복사
                    Button {
                        withAnimation(.spring) {
                            viewModel.copySelectedRoutineUnit()
                        }
                    } label: {
                        Image("icon.copy")
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
                
                CustomNavigationLink(isActive: $viewModel.isRoutineAddViewActive,
                                     destination: AddRoutineView(routineViewModel: viewModel),
                                     label: {
                    Image("icon.active.plus")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
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
        ScrollViewReader { value in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    if(viewModel.routineUnitCardViewModelList.isEmpty) {
                        emptyCardListView()
                    } else {
                        routineUnitCardListView()
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
    private func routineUnitCardListView() -> some View {
        ForEach(viewModel.routineUnits.indices, id: \.self) { index in
            
            let routineUnit = viewModel.routineUnits[index]
            
            RoutineUnitCardView(routineViewModel: viewModel,
                                viewModel: RoutineUnitViewModel(routineUnit: routineUnit),
                                editModeActivate: $viewModel.editModeActivate,
                                index: index)
                                .id(routineUnit.id)
        }
        
        Spacer()
            .frame(height: 68)
    }
    
    @ViewBuilder
    private func emptyCardListView() -> some View {
        EmptyRoutineUnitCardView(viewModel: viewModel)

    }
}




