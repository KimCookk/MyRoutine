//
//  RoutineCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/20/24.
//

import SwiftUI

struct RoutineUnitTagCardView: View {
    
    let tag:String
    let styleColor:Color
    
    var backgroundColor: Color {
        return styleColor.opacity(0.1)
    }
    
    var body: some View {
        Text(tag)
            .font(RubikFont(fontStyle: .regular
                                 , size: 12).font())
            .foregroundColor(styleColor)
            .padding(5)
            .background( RoundedRectangle(cornerRadius: 6.0)
                .fill(backgroundColor))
        
        
    }
}

#Preview {
    RoutineUnitTagCardView(tag: "Test", styleColor: Color.red)
}
