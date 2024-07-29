//
//  TabBarItem.swift
//  MyRoutine
//
//  Created by 김태성 on 7/29/24.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, favorite, profile
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorites"
        case .profile:
            return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .red
        case .favorite:
            return .blue
        case .profile:
            return .green
        }
    }
}
