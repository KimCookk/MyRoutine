//
//  RoutineSummaryView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

#Preview {
    RoutineControlView(viewModel: RoutineDetailViewModel(routineUnits: []))
}

struct RoutineControlView: View {
    @ObservedObject var viewModel: RoutineDetailViewModel
    
    @State private var isShowingStopCheckAlert = false
    
    var body: some View {
        VStack(spacing: 25) {
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
                                        viewModel.allPauseTimer()
                                    }
                                } label: {
                                    Image("icon.active.pause")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                                
                                Button {
                                    isShowingStopCheckAlert = true
                                } label: {
                                    Image("icon.active.stop")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                                .alert("메시지", isPresented: $isShowingStopCheckAlert) {
                                    Button("OK") {
                                        withAnimation(.spring) {
                                            viewModel.stopSummaryTimer()
                                            viewModel.allResetTask()
                                        }
                                    }
                                    
                                    Button("Cancel", role: .cancel) { }
                                } message: {
                                    Text("전체 루틴 진행이 초기화됩니다. 정말 정지하시겠습니까?")
                                }
                            }
                        }
                        .foregroundColor(Color.black)
                        .padding(.vertical, 26)
                        .padding(.horizontal, 16)
                    }
                    .frame(height: 80)
        }
    }
    
    /// 사용되지 않음.
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
    
    /// 사용되지 않음.
    @ViewBuilder
    private func routineTitleView() -> some View {
        GeometryReader() { geo in
            ZStack {
                TextField("Title을 입력해주세요.",
                          text: $viewModel.routineSummary.title,
                          onCommit: {
                    if(viewModel.routineSummary.title.isEmpty == false) {
                        viewModel.titleActivate = true
                    }
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
