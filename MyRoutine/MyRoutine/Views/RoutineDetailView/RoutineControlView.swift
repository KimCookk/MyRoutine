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
                                    viewModel.isShowingStopCheckAlert = true
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
                        .alert("메시지", isPresented: $viewModel.isShowingStopCheckAlert) {
                            Button("OK") {
                                withAnimation(.spring) {
                                    viewModel.stopSummaryTimer()
                                    viewModel.allResetTask()
                                    viewModel.isShowingStopCheckAlert = false
                                }
                            }
                            Button("Cancel", role: .cancel) { 
                                viewModel.isShowingStopCheckAlert = false
                            }
                        } message: {
                            Text("전체 루틴 진행이 초기화됩니다. 정말 정지하시겠습니까?")
                        }
                    }
                    .frame(height: 80)
        }
    }
   
}
