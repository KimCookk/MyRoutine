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
    
    @State private var isActivate: Bool = false
    
    var body: some View {
        Image(isActivate ? activeIconName : inactiveIconName)
            .onTapGesture {
                isActivate.toggle()
            }
    }
}

#Preview {
    ToggleIconView(activeIconName: "icon.active.check", inactiveIconName: "icon.inactive.check")
}
