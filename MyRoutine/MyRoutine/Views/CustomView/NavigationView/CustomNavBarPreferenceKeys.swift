//
//  CustomNavBarTitlePreferenceKeys.swift
//  MyRoutine
//
//  Created by 김태성 on 7/27/24.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKeys: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


struct CustomNavBarUseBackButtonPreferenceKeys: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct CustomNavBarOptionButtonItemsPreferenceKeys: PreferenceKey {
    
    static var defaultValue: [NavigationBarOptionButtomItem] = []
    
    static func reduce(value: inout [NavigationBarOptionButtomItem], nextValue: () -> [NavigationBarOptionButtomItem]) {
        value = nextValue()
     }
}

extension View {
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKeys.self, value: title)
    }
    
    func customNavigationUseBackButton(_ use: Bool) -> some View {
        preference(key: CustomNavBarUseBackButtonPreferenceKeys.self, value: use)
    }
    
    func customNavigationBarUseOptionButton(_ options: [NavigationBarOptionButtomItem]) -> some View {
        preference(key: CustomNavBarOptionButtonItemsPreferenceKeys.self, value: options)
    }
    
    func customNavigationBarItems(title: String = "", useBackButton: Bool = false, options: [NavigationBarOptionButtomItem] = []) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationUseBackButton(useBackButton)
            .customNavigationBarUseOptionButton(options)
    }
}
