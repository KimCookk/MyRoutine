//
//  RoutineSummaryView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

#Preview {
    RoutineSummaryView(viewModel: RoutineViewModel())
}

struct RoutineSummaryView: View {
    @ObservedObject var viewModel: RoutineViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            routineSummaryHeaderView()
                .padding(.horizontal, 10)
            
            timerCardView()

        }
    }
    
    @ViewBuilder
    private func timerCardView() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay{
                HStack {
                    Text(viewModel.routineSummary.summaryContent)
                        .font(NotoSansKRFont(fontStyle: .medium, size: 32).font())
                    Spacer()
                    
                    HStack(spacing: 30) {
                        
                        Button {
                            withAnimation(.spring) {
                                viewModel.startSummaryTimer()
                            }
                        } label: {
                            Image("icon.active.play")
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                        Button {
                            withAnimation(.spring) {
                                viewModel.puaseSummaryTimer()
                            }
                        } label: {
                            Image("icon.active.pause")
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                        Button {
                            withAnimation(.spring) {
                                viewModel.stopSummaryTimer()
                            }
                        } label: {
                            Image("icon.active.stop")
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                    }
                }
                .foregroundColor(Color.black)
                .padding(.vertical, 26)
                .padding(.horizontal, 16)
            }
            .frame(height: 80)
    }
    
    @ViewBuilder
    private func routineSummaryHeaderView() -> some View {
        HStack(spacing: 30) {
           
            routineTitleView()
                .frame(height: 30)
            
            Button {
                withAnimation(.spring) {
                    viewModel.titleActivate = false
                }
            } label: {
                Image("icon.pencil")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
        }
    }
    
    @ViewBuilder
    private func routineTitleView() -> some View {
        GeometryReader() { geo in
            ZStack {
                TextField("Title을 입력해주세요.",
                          text: $viewModel.routineSummary.title,
                          onCommit: {
                    viewModel.titleActivate = true
                })
                .font(NotoSansKRFont(fontStyle: .bold,
                                     size: 20).font())
                .foregroundColor(.gray)
                
                if(viewModel.titleActivate == true) {
                    Text(viewModel.routineSummary.title)
                        .font(NotoSansKRFont(fontStyle: .bold,
                                             size: 20).font())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .background(.background001)
                }
                    
            }
        }
    }
   

}
