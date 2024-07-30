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
            
            RoutineView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            CustomNavigationView {
                ZStack {
                    Color.red.ignoresSafeArea()
                    
                    CustomNavigationLink(destination:
                        Text("Detiantion")
                            .customNavigationTitle("Seconds Screen")
                            .customNavigationUseBackButton(true)
                    , label: {
                        Text("Navigate")
                    })
                }
                .customNavigationBarItems(
                    title: "Favorites View",
                    useBackButton: false,
                    useOptionButton: false
                )
            }
            .tabBarItem(tab: .favorite, selection: $tabSelection)
            
            CustomNavigationView {
                ZStack {
                    Color.green.ignoresSafeArea()
                    
                    CustomNavigationLink(destination:
                        Text("Detiantion")
                            .customNavigationTitle("Seconds Screen")
                            .customNavigationUseBackButton(true)
                    , label: {
                        Text("Navigate")
                    })
                }
                .customNavigationBarItems(
                    title: "Profile View",
                    useBackButton: false,
                    useOptionButton: false
                )
            }
            .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

#Preview {
    CustomAppView()
}
