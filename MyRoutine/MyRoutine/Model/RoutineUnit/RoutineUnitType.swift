//
//  RoutineUnitType.swift
//  MyRoutine
//
//  Created by 김태성 on 6/22/24.
//

import Foundation

enum RoutineUnitType {
    // 사용자의 체크를 통해 완료 처리
    // 체크 박스 필요
    case todo
    // 사용자의 체크를 통해 완료 처리
    // 체크 박스 및 인포박스 필요
    // 인포 박스 : 누르면 팁 팝업
    case tip
    // 사용자의 체크를 통해 완료 처리
    // 체크 박스 및 start 버튼 pause 버튼
    case timer
    // 사용자의 체크를 통해 완료 처리 및 지정 된 시간
    // 체크 박스 및 start 버튼 pause 버튼 stop 버튼 timer
    case stopWatch
    // 사용자의 체크를 통해 완료 처리 및 지정 된 카운터
    // 체크 박스 및 + - 버튼, 현황
    case counter
    
    var iconImageName: String {
        switch self {
        case .todo:
            return "routine.todo.type"
        case .tip:
            return "routine.tip.type"
        case .timer:
            return "routine.timer.type"
        case .stopWatch:
            return "routine.stopwatch.type"
        case .counter:
            return "routine.counter.type"
        }
    }
}
