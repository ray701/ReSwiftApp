//
//  AppState.swift
//  ReSwiftApp
//
//  Created by 野瀬 玲 on 2021/05/27.
//

import ReSwift

struct AppState {
    private(set) var counter: CounterState
    private(set) var sentence: SentenceState
}

func appReducer(_ action: Action, _ state: AppState?) -> AppState {
    return AppState(
        counter: CounterState.reducer(action, state?.counter),
        sentence: SentenceState.reducer(action, state?.sentence)
    )
}
