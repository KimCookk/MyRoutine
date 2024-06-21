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
    // View에서 편집 누르면 select 버튼 있어야함
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
    enum RoutineType {
        // 사용자의 체크를 통해 완료 처리
        // 체크 박스 필요
        case todo
        // 사용자의 체크를 통해 완료 처리
        // 체크 박스 및 인포박스 필요
        // 인포 박스 : 누르면 팁 팝업
        case tip
        // 사용자의 체크를 통해 완료 처리
        // 체크 박스 및 start 버튼 pause 버튼
        case timer
        // 사용자의 체크를 통해 완료 처리 및 지정 된 시간
        // 체크 박스 및 start 버튼 pause 버튼 stop 버튼 timer
        case stopWatch
        // 사용자의 체크를 통해 완료 처리 및 지정 된 카운터
        // 체크 박스 및 + - 버튼, 현황
        case counter
    }
    
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



