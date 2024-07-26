//
//  AppView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/26/24.
//

import SwiftUI

struct CustomAppView: View {
    
    @State private var useNavigation: Bool = true
    @State private var useBottomTab: Bool = true
    
    var body: some View {
        ZStack {
            // Background
            Color.gray001.ignoresSafeArea()
        }
    }
}

#Preview {
    CustomAppView()
}
