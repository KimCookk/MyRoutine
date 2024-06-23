//
//  RoutineSummaryView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

#Preview {
    RoutineSummaryView()
}

struct RoutineSummaryView: View {
    var body: some View {
        VStack(spacing: 25) {
            RoutineSummaryHeaderView()
            
            TimerCardView()

        }
    }
}

private struct RoutineSummaryHeaderView: View {
    var body: some View {
        HStack {
            Text("Title")
                .font(NotoSansKRFont(fontStyle: .bold, size: 24).font())
            
            Spacer()
            
            EditModeView()
           
        }
    }
}

private struct EditModeView: View {
    @State var isEdited: Bool = false
    
    var body: some View {
        HStack(spacing: 12) {
            
            Spacer()
            
            if(isEdited) {
                Button(action: {
                    
                }, label: {
                    Image("icon.arrow.up")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                
                Button(action: {
                    
                }, label: {
                    Image("icon.arrow.down")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                
                Button(action: {
                    
                }, label: {
                    Image("icon.pencil")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
                
                Button(action: {
                    
                }, label: {
                    Image("icon.trash")
                        .resizable()
                        .frame(width: 15, height: 15)
                })
            }
            
            Button(action: {
                withAnimation(.spring) {
                    isEdited.toggle()
                }
            }, label: {
                Image("icon.menu.dots")
                    .resizable()
                    .frame(width: 15, height: 15)
            })
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

