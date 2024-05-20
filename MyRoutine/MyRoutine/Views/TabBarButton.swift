//
//  TabBarButton.swift
//  MyRoutine
//
//  Created by 김태성 on 5/20/24.
//

import SwiftUI

struct TabBarButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            VStack {
                Image(systemName: "pencil")
                    .frame(width: 20, height: 20)
                    //.padding(.all, 8)
                    .cornerRadius(5)
                    .overlay (RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.blue, lineWidth: 2)
                    )
                
                Text("Label")
                    .font(.system(size: 10, weight: .medium))
                    //.font()
            }
        })
    }
}

#Preview {
    TabBarButton()
}
