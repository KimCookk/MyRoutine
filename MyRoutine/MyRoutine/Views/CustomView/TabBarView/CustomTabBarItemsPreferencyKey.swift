//
//  CustomTabBarItemsPreferencyKey.swift
//  MyRoutine
//
//  Created by 김태성 on 7/29/24.
//

import Foundation
import SwiftUI

struct CustomTabBarItemsPreferencyKey: PreferenceKey {
    
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct CustomTabBarItemViewModifer: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: CustomTabBarItemsPreferencyKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        self
            .modifier(CustomTabBarItemViewModifer(tab: tab, selection: selection))
    }
}
