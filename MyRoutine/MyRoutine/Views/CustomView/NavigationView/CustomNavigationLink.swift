//
//  CustomNavigationLink.swift
//  MyRoutine
//
//  Created by 김태성 on 7/27/24.
//

import SwiftUI

struct CustomNavigationLink<Label: View, Destination: View>: View {
    @Binding var isActive: Bool

    let destination: Destination
    let label: Label
    
    init(isActive: Binding<Bool>, destination: Destination, @ViewBuilder label: () -> Label) {
        self._isActive = isActive
        
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            isActive: $isActive,
            destination: {
                CustomNavigationBarContainerView(content: {
                    destination
                })
            },
            label: {
                label
            }
        )
    }
}

#Preview {
    CustomNavigationView {
        CustomNavigationLink(isActive: Binding.constant(true),
                             destination: Text("Destination"),
                             label: {
            Text("Click Me")
        })
    }
}
