//
//  NavigationBarOptionButtomItem.swift
//  MyRoutine
//
//  Created by 김태성 on 7/31/24.
//

import Foundation
import SwiftUI

enum NavigationBarOptionButtomItem: Hashable, Identifiable {
    case edit, add
    
    var id: String {
        return "\(self.hashValue)"
    }
    
    var iconName: String {
        switch self {
        case .edit:
            return "icon.pencil"
        case .add:
            return "icon.active.plus"
        }
    }
}
