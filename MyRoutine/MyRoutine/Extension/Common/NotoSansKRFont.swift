//
//  NotoSansKRFont.swift
//  MyRoutine
//
//  Created by 김태성 on 6/20/24.
//

import Foundation
import SwiftUI

struct NotoSansKRFont {
    enum FontStyle {
        case regular
        case medium
        case bold
    }
    
    let fontStyle: FontStyle
    let size: CGFloat
    var name: String {
        switch fontStyle {
        case .regular:
            return "NotoSansKR-Regular"
        case .medium:
            return "NotoSansKR-Medium"
        case .bold:
            return "NotoSansKR-Bold"
        }
    }
    
    func font() -> Font {
        return Font.custom(name, size: size)
    }
}
