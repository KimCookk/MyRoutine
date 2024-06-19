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

private struct TimerCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay{
                HStack {
                    Text("00:32:10")
                        .font(.system(size: 32,
                                      weight: .medium))
                    Spacer()
                    
                    HStack(spacing: 30) {
                        Image(systemName: "play")
                        
                        Image(systemName: "pause")
                    }
                }
                .foregroundColor(Color.black)
                .padding(.vertical, 26)
                .padding(.horizontal, 16)
            }
            .frame(height: 80)
    }
}


struct RoutineSummaryHeaderView: View {
    var body: some View {
        HStack {
            Text("Title")
                .font(.system(size: 24,
                              weight: .bold))
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Color.gray001)
            })
        }
    }
}
