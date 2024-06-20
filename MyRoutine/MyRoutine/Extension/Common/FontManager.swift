//
//  FontManager.swift
//  MyRoutine
//
//  Created by 김태성 on 6/20/24.
//

import Foundation
import SwiftUI

class FontManager {
    static let shared = FontManager()
    
    private init() {
        
    }
    
    func customFont(_ name: String, size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}
