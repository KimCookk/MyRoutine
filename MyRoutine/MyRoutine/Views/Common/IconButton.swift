//
//  ToggleButton.swift
//  MyRoutine
//
//  Created by 김태성 on 6/29/24.
//

import SwiftUI

struct IconButton: View {
    let activeIconName: String
    let inactiveIconName: String
    var useToggle: Bool
    var onTapped: (()->())?
    
    @State private var isActivate: Bool
    
    private var iconName: String {
        if(useToggle) {
            if(isActivate) {
                return activeIconName
            } else {
                return inactiveIconName
            }
        } else {
            return activeIconName
        }
    }
    
    init(activeIconName: String,
         inactiveIconName: String,
         isActivate: Bool,
         onTapped: (() -> ())? = nil) {
        self.activeIconName = activeIconName
        self.inactiveIconName = inactiveIconName
        self.useToggle = true
        self.onTapped = onTapped
        self.isActivate = isActivate
    }
    
    init(activeIconName: String,
         onTapped: (() -> ())? = nil) {
        self.activeIconName = activeIconName
        self.inactiveIconName = ""
        self.useToggle = false
        self.onTapped = onTapped
        self.isActivate = true
    }
    
    
    
    var body: some View {
        Button {
            if(useToggle) {
                isActivate.toggle()
            }
            
            if let onTapped = onTapped {
                onTapped()
            }
        } label: {
            Image(iconName)
                .resizable()
                .frame(width: 15, height: 15)
        }
        
    }
    
    
}

//#Preview {
//    ToggleButton()
//}
