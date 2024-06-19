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
                    .font(.system(size: 20,
                                  weight: .medium))
                
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
                            .font(.system(size: 14,
                                          weight: .medium))
                        
                        HStack {
                            // TODO: Tag View
                        }
                        .frame(height: 24)
                    }
                    
                    
                    
                    RoutineCardOption()
                }
                .padding(16)
            }
            .frame(height: 84)
        
        
    }
}

private struct RoutineCardOption: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text("00:42:21")
                .font(.system(size: 12,
                              weight: .regular))
                .lineLimit(1)
            
            Image("play")
            
        }
        .frame(width: 54)
        .foregroundColor(Color.gray002)
    }
}



