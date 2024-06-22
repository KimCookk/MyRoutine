//
//  ToggleIconView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/21/24.
//

import SwiftUI

struct ToggleIconView: View {
    let activeIconName: String
    let inactiveIconName: String
    var useToggle: Bool = true
    
    @State private var isActivate: Bool
    
    init(activeIconName: String, inactiveIconName: String) {
        self.activeIconName = activeIconName
        self.inactiveIconName = inactiveIconName
        isActivate = false
    }
    
    init(activeIconName: String, useToggle: Bool) {
        self.activeIconName = activeIconName
        self.inactiveIconName = ""
        self.useToggle = useToggle
        
        if(useToggle == false) {
            isActivate = true
        } else {
            isActivate = false
        }
    }
    
    var body: some View {
        
        Image(isActivate ? activeIconName : inactiveIconName)
            .resizable()
            .frame(width: 15, height: 15)
            .onTapGesture {
                if(useToggle) {
                    isActivate.toggle()
                }
            }
    }
}

#Preview {
    ToggleIconView(activeIconName: "icon.active.check", useToggle: false)
}
