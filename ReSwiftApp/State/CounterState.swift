//
//  CounterState.swift
//  ReSwiftApp
//
//  Created by 野瀬 玲 on 2021/05/26.
//

import ReSwift

struct CounterState {
    var value: Int = 0
}

extension CounterState {
    public enum Action: ReSwift.Action {
        case increase
        case decrease
    }
}

extension CounterState: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

extension CounterState {
    static func reducer(_ action: ReSwift.Action, _ state: CounterState?) -> CounterState {
        // if no state has been provided, create the default state
        var newState = state ?? CounterState()

        switch action {
        case let action as CounterState.Action:
            switch action {
            case .increase:
                newState.value += 1
            case .decrease:
                newState.value -= 1
            }
        default:
            break
        }

        return newState
    }
}
