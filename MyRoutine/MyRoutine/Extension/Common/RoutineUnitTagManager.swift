//
//  RoutineUnitTagManager.swift
//  MyRoutine
//
//  Created by 김태성 on 7/7/24.
//

import Foundation
import SwiftUI

class RoutineUnitTagManager {
    static let shared = RoutineUnitTagManager()
    
    private var tagDictionary: [String: RoutineUnitTag] = [:]
    // key : routineUnitTag name
    private let styleColorStrings: [String] = ["FD5B71", "6BDC7D", "6B7DFD", "FDA15B", "BD6BFD", "B0B0B0"]
    
    private init() {
      // KTS : dummy Data
        appendTag("Work")
        appendTag("Project")
        appendTag("Programming")
        appendTag("Weekly")
        appendTag("Test")
        appendTag("Shared")
        appendTag("Community")
    }
    
    func appendTag(_ name: String) {
        if(tagDictionary.keys.contains(name) == false) {
            let styleColorString = styleColorStrings[tagDictionary.count % styleColorStrings.count]
            let routineUnitTag = RoutineUnitTag(name: name, styleColorString: styleColorString)
            
            tagDictionary.updateValue(routineUnitTag, forKey: name)
        }
    }
    
    func appendTags(_ names: [String]) {
        names.forEach { name in
            appendTag(name)
        }
    }
    
    func getTag(_ name: String) -> RoutineUnitTag? {
        return tagDictionary[name]
    }
    
    func getTags(_ names: [String]) -> [RoutineUnitTag] {
        var tags: [RoutineUnitTag] = []
        
        names.forEach { name in
            if let tag = getTag(name) {
                tags.append(tag)
            }
        }
        
        return tags
    }
}
