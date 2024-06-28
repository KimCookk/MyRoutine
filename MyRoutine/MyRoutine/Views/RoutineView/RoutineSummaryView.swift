//
//  RoutineSummaryView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

//#Preview {
//    RoutineSummaryView()
//}

struct RoutineSummaryView: View {
    @ObservedObject var viewModel: RoutineViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            routineSummaryHeaderView()
            
            TimerCardView()

        }
    }
    
    @ViewBuilder
    private func routineSummaryHeaderView() -> some View {
        HStack {
            Text("Title")
                .font(RubikFont(fontStyle: .bold, size: 24).font())
            
            Spacer()
            
            editModeView()
        }
    }
    
    @ViewBuilder
    private func editModeView() -> some View {
        HStack(spacing: 12) {
            
            Spacer()
            
            if(viewModel.editModeActivate) {
                Button(action: {
                    withAnimation(.spring) {
                        viewModel.upOrderRoutineUnitSelected()
                    }
                }, label: {
                    Image("icon.arrow.up")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                
                Button(action: {
                    withAnimation(.spring) {
                        viewModel.downOrderRoutineUnitSelected()
                    }
                }, label: {
                    Image("icon.arrow.down")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                
                Button(action: {
                    // selected가 하나인지 확인 필요
                }, label: {
                    Image("icon.pencil")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                
                Button(action: {
                    // Alert 필요 제거 확인
                    withAnimation(.spring) {
                        viewModel.deleteRoutineUnitSelected()
                    }
                }, label: {
                    Image("icon.trash")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
            }
            
            Button(action: {
                withAnimation(.spring) {
                    viewModel.toggleEditModeActivate()
                }
            }, label: {
                Image("icon.menu.dots")
                    .resizable()
                    .frame(width: 15, height: 15)
            })
        }

    }

    private struct TimerCardView: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay{
                    HStack {
                        Text("00:32:10")
                            .font(RubikFont(fontStyle: .medium, size: 32).font())
                        Spacer()
                        
                        HStack(spacing: 30) {
                            Image("icon.active.play")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Image("icon.active.pause")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Image("icon.active.stop")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding(.vertical, 26)
                    .padding(.horizontal, 16)
                }
                .frame(height: 80)
        }
    }


}
