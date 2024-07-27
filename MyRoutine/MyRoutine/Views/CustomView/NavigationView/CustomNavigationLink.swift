//
//  CustomNavigationLink.swift
//  MyRoutine
//
//  Created by 김태성 on 7/27/24.
//

import SwiftUI

struct CustomNavigationLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(destination: {
            CustomNavigationBarContainerView(content: {
                destination
            })
        }, label: {
            label
        })
    }
}

#Preview {
    CustomNavigationView {
        CustomNavigationLink(destination: Text("Destination"), label: {
            Text("Click Me")
        })
    }
}
