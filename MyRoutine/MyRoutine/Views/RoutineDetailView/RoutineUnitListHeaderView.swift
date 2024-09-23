//
//  RoutineUnitListHeaderView.swift
//  MyRoutine
//
//  Created by 김태성 on 9/23/24.
//

import SwiftUI

#Preview {
    RoutineUnitListHeaderView(viewModel: RoutineDetailViewModel(routineUnits: []))
}


struct RoutineUnitListHeaderView: View {
    @ObservedObject var viewModel: RoutineDetailViewModel
    
    var body: some View {
        HStack {
            Text("Rotuine")
                .font(NotoSansKRFont(fontStyle: .medium,
                                     size: 20).font())
            Spacer()
            
            menuView()
        }
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    private func menuView() -> some View {
        HStack(spacing: 12) {
            if(!viewModel.routineUnitCardViewModelList.isEmpty) {
                if(viewModel.isEditingEnabled) {
                    
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

