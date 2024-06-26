//
//  EmptyRoutineUnitCardView.swift
//  MyRoutine
//
//  Created by 김태성 on 6/26/24.
//

import SwiftUI

struct EmptyRoutineUnitCardView: View {

    @ObservedObject var viewModel: RoutineViewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            //.strokeBorder(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .fill(Color.white)
            .overlay {
                GeometryReader { geo in
                    Image("icon.add.routine")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .offset(x: geo.size.width / 2 - 18, y: geo.size.height / 2 - 18)
                }
            }
            .frame(height: 84)
            .onTapGesture {
                withAnimation(.spring) {
                    viewModel.addRoutineUnit()
                }
            }
    }
}

#Preview {
    EmptyRoutineUnitCardView(viewModel: RoutineViewModel())
}
