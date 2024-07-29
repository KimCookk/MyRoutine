//
//  CustomTabBarContainerView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/29/24.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs,
                             selection: $selection,
                             localSelection: selection)
        }
        .onPreferenceChange(CustomTabBarItemsPreferencyKey.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    CustomTabBarContainerView(selection: .constant(testTabs.first!)) {
        Color.red
    }
}
