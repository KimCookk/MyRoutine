//
//  RoutineInfoView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/19/24.
//

import SwiftUI

struct RoutineInfoView: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Routine")
                    .font(NotoSansKRFont(fontStyle: .medium, size: 20).font())
                
                Spacer()
            }
            
            RoutineCardListView()
            
            Spacer()
        }
    }
}

#Preview {
    RoutineInfoView()
}

private struct RoutineCardListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                RoutineCardView()
                
                RoutineCardView()
            }
        }
    }
}

private struct RoutineTagCardListView:View {
    var body: some View {
        HStack(spacing: 8) {
            RoutineTagCardView(tag: "Personal", styleColor: Color.gray)
            
            RoutineTagCardView(tag: "Workout", styleColor: Color.orange)
            
            Spacer()
        }
    }
}

private struct RoutineCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay {
                HStack(spacing: 16) {
                    Image("routine.todo.type")
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Routine Unit Title")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(NotoSansKRFont(fontStyle: .medium, size: 14).font())
                        
                        RoutineTagCardListView()
                        .frame(height: 24)
                    }
                    
                    
                    
                    RoutineCardOptionView()
                }
                .padding(16)
            }
            .frame(height: 84)
        
        
    }
}

private struct RoutineCardOptionView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text("00:42:21")
                .font(NotoSansKRFont(fontStyle: .regular, size: 12).font())
                .lineLimit(1)
            
            Image("play")
            
        }
        .frame(width: 54)
        .foregroundColor(Color.gray002)
    }
}



