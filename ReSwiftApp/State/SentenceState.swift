//
//  SentenceState.swift
//  ReSwiftApp
//
//  Created by 野瀬 玲 on 2021/05/27.
//

import ReSwift

struct SentenceState {
    var value: String = ""
}

extension SentenceState: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

extension SentenceState {
    public enum Action: ReSwift.Action {
        case reset
        case increaseString(String)
    }
}

extension SentenceState {
    static func reducer(_ action: ReSwift.Action, _ state: SentenceState?) -> SentenceState {
        // if no state has been provided, create the default state
        var newState = state ?? SentenceState()

        switch action {
        case let action as SentenceState.Action:
            switch action {
            case .reset:
                newState.value = ""
            case .increaseString(let string):
                newState.value += string
            }
        default:
            break
        }

        return newState
    }
}
