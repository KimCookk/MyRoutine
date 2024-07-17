//
//  BottomTabView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/17/24.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 80) {
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("icon.active.routine")
                }
                
                Button {
                    
                } label: {
                    Image("icon.active.plus")
                }
                
                Button {
                    
                } label: {
                    Image("icon.active.analysis")
                }

                Spacer()
            }
            .frame(height: 70)
            .background(.white)
            .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    BottomTabView()
}
