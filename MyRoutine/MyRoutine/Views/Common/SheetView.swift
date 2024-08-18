//
//  SheetView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/18/24.
//

import SwiftUI

struct SheetView: View {
    
    var title: String
    var content: String
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                Text(title)
                .frame(width: geo.size.width)
                .background(.white)
                
                ScrollView(showsIndicators: false) {
                    Text(content)
                        .frame(width: geo.size.width, alignment: .leading)
                        .background()
                }
                .frame(width: geo.size.width)
                .background(.gray)
            }
            .background(.orange)
        }
        .background(.red)
        
    }
}

#Preview {
    SheetView(title: "Title",
              content: "Content")
}
