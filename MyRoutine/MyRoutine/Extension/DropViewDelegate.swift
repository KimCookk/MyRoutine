//
//  DropViewDelegate.swift
//  MyRoutine
//
//  Created by 김태성 on 6/11/24.
//

import SwiftUI
//
//struct DropViewDelegate: DropDelegate {
//    
//    let destinationItem: DummyRoutine
//    @Binding var items: [DummyRoutine]
//    @Binding var draggedItem: DummyRoutine?
//    
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//    
//    func performDrop(info: DropInfo) -> Bool {
//        return true
//    }
//    
//    func dropEntered(info: DropInfo) {
//        if let draggedItem {
//            let fromIndex = items.firstIndex(of: draggedItem)
//            if let fromIndex {
//                let toIndex = items.firstIndex(of: destinationItem)
//                if let toIndex, fromIndex != toIndex {
//                    withAnimation(.default) {
//                        items.move(fromOffsets: IndexSet(integer: fromIndex),
//                                   toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
//                    }
//                }
//            }
//        }
//    }
//    
//}
