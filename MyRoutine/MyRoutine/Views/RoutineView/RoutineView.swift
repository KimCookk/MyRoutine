//
//  RoutineView.swift
//  MyRoutine
//
//  Created by 김태성 on 5/21/24.
//

import SwiftUI

struct RoutineView: View {
    
    @State var items: [DummyRoutine];
    @State private var draggedItem: DummyRoutine?
    
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(spacing: 10, content: {
                Spacer()
                
                ForEach(items, id: \.self) { item in
                    RoutineUnitCellView(routine: item)
                        .padding(.horizontal, 10)
                        .onDrag({
                            self.draggedItem = item
                            //item.activateDrag()
                            return NSItemProvider()
                        })
                        .onDrop(of: [.text],
                                delegate: DropViewDelegate(destinationItem: item, items: self.$items, draggedItem: self.$draggedItem)
                        )
                        
                }
                
                Spacer()
            })
        })
    }
}

#Preview {
    RoutineView(items: dummyRoutines)
}
