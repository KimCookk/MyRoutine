//
//  CustomNavigationBarContainerView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/26/24.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var useBackButton: Bool = true
    @State private var title: String = ""
    @State private var useOptionButton: Bool = true
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            content
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
        }
    }
}

#Preview {
    CustomNavigationBarContainerView {
        Color.green.ignoresSafeArea()
    }
}
