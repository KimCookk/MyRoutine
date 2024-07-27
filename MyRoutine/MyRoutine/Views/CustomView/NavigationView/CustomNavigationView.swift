//
//  CustomNavigationView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/26/24.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavigationBarContainerView {
                content
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    CustomNavigationView {
        Color.orange.ignoresSafeArea()
    }
}
