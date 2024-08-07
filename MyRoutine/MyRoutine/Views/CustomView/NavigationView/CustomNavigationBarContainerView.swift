//
//  CustomNavigationBarContainerView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/26/24.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var useBackButton: Bool = true
    @State private var title: String = "TEst"
    @State private var options: [NavigationBarOptionButtomItem] = [.edit]
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(useBackButton: useBackButton,
                              title: title,
                              options: options)
            
            content
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
        }
        //.background(.background001)
        .onPreferenceChange(CustomNavBarTitlePreferenceKeys.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarUseBackButtonPreferenceKeys.self, perform: { value in
            self.useBackButton = value
        })
        .onPreferenceChange(CustomNavBarOptionButtonItemsPreferenceKeys.self, perform: { value in
            self.options = value
        })
        .navigationBarHidden(true)
    }
}

#Preview {
    CustomNavigationBarContainerView {
        ZStack {
            Color.green.ignoresSafeArea()
            
            Text("HelloWorld!")
                .customNavigationBarItems(
                    title: "TEst",
                    useBackButton: true,
                    options: [.edit]
                )
        }
    }
}
