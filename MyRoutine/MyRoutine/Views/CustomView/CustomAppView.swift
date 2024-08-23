//
//  AppView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/26/24.
//

import SwiftUI

struct CustomAppView: View {
    
    //@State private var useNavigation: Bool = true
    //@State private var useBottomTab: Bool = true
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        
        CustomTabBarContainerView(selection: $tabSelection, tabUse: false) {
            
            RoutineListView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            
        }
        
    }
}

#Preview {
    CustomAppView()
}
