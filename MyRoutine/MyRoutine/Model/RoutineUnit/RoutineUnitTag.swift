//
//  Tag.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import Foundation

struct RoutineUnitTag: Identifiable {
    let id: UUID
    let name: String
    let styleColorString: String
    // style color 로 init 시 제공해주는게 좋을듯

    init(name: String, styleColorString: String) {
        self.id = UUID()
        self.name = name
        self.styleColorString = styleColorString
    }
}
