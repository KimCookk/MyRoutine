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
        
        CustomNavigationLink(isActive: $viewModel.isRoutineAddViewActive,
                             destination: AddRoutineView(routineViewModel: viewModel),
                             label: {
            RoundedRectangle(cornerRadius: 10)
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
        })
        
//        RoundedRectangle(cornerRadius: 10)
//            .fill(Color.white)
//            .overlay {
//                GeometryReader { geo in
//                    Image("icon.add.routine")
//                        .resizable()
//                        .frame(width: 36, height: 36)
//                        .offset(x: geo.size.width / 2 - 18, y: geo.size.height / 2 - 18)
//                }
//            }
//            .frame(height: 84)
    }
}

#Preview {
    EmptyRoutineUnitCardView(viewModel: RoutineViewModel(routineUnits: []))
}
