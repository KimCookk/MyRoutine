//
//  CustomTabBar.swift
//  MyRoutine
//
//  Created by 김태성 on 5/20/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                
                Spacer()
                
                Rectangle()
                    .frame(width: geo.size.width, height: 1)
                    .background(.gray900)
                
                HStack(spacing: 58) {
                    
                    TabBarButton()
                    
                    TabBarButton()
                    
                    TabBarButton()
                    
                    TabBarButton()
                    
                }
                .padding(.top, 8)
            }
        }
    }
}

#Preview {
    TabBar()
}
