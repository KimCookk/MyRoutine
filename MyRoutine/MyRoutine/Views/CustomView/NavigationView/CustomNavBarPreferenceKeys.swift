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

struct CustomNavBarUseOptionButtonPreferenceKeys: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
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
    
    func customNavigationBarUseOptionButton(_ use: Bool) -> some View {
        preference(key: CustomNavBarUseOptionButtonPreferenceKeys.self, value: use)
    }
    
    func customNavigationBarItems(title: String = "", useBackButton: Bool = false, useOptionButton: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationUseBackButton(useBackButton)
            .customNavigationBarUseOptionButton(useOptionButton)
    }
}
