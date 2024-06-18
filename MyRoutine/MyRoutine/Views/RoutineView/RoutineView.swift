//
//  RoutineView.swift
//  MyRoutine
//
//  Created by 김태성 on 5/21/24.
//

import SwiftUI

struct RoutineView: View {
    
    var body: some View {
        VStack {
            
            RoutineInfoView()
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
            
            Spacer()
        }
    }
}

#Preview {
    RoutineView()
}

private struct RoutineInfoView: View {
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("Title")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.gray001)
                })
            }
            
            TimerCardView()
            
            Spacer()
        }
    }
}

private struct TimerCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.black001)
            .overlay(
                HStack {
                    Text("00:32:10")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                    HStack(spacing: 30) {
                        Image(systemName: "play")
                        
                        Image(systemName: "pause")
                    }
                }
                .foregroundColor(Color.white)
                .padding(.vertical, 26)
                .padding(.horizontal, 16)
            )
            .frame(height: 80)
    }
}
