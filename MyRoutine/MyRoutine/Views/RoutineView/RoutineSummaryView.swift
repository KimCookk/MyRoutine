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
                .font(NotoSansKRFont(fontStyle: .bold, size: 24).font())
            
            Spacer()
            
            editModeView()
        }
    }
    
    @ViewBuilder
    private func editModeView() -> some View {
        HStack(spacing: 12) {
            
            Spacer()
            
            if(viewModel.editModeActivate) {
                
                IconButton(activeIconName: "icon.arrow.up") {
                    withAnimation(.spring) {
                        viewModel.upOrderRoutineUnitSelected()
                    }
                }
                
                IconButton(activeIconName: "icon.arrow.down") {
                    withAnimation(.spring) {
                        viewModel.downOrderRoutineUnitSelected()
                    }
                }
                
                IconButton(activeIconName: "icon.pencil") {
                    withAnimation(.spring) {
                        // selected가 하나인지 확인 후 수정
                    }
                }
                
                IconButton(activeIconName: "icon.trash") {
                    withAnimation(.spring) {
                        viewModel.deleteRoutineUnitSelected()
                    }
                }
            }
            
            IconButton(activeIconName: "icon.menu.dots") {
                withAnimation(.spring) {
                    viewModel.toggleEditModeActivate()
                }
            }
        }

    }

    private struct TimerCardView: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay{
                    HStack {
                        Text("00:32:10")
                            .font(NotoSansKRFont(fontStyle: .medium, size: 32).font())
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
