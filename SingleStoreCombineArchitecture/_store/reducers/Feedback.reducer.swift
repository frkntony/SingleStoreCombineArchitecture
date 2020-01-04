//
//  Feedback.reducer.swift
//  SingleStoreCombineArchitecture
//
//  Created by Anton Elistratov on 04.01.2020.
//  Copyright © 2020 Anton Elistratov. All rights reserved.
//

enum Feedback {
    struct State: Builder {
        var count = 0
    }

    enum Event {
        case increment
        case decrement
    }

    static func reducer(
        state: State,
        event: Event
    ) -> State {
        switch event {
        case .increment:
            return state.set(\.count, state.count + 1)
        case .decrement:
            return state.set(\.count, state.count - 1)
        }
    }
}


//struct feedbackState: Builder {
//		var count = 0
//}
//
//enum FeedbackActions {
//		case increment
//		case decrement
//}
//
//static func feedbackReducer(
//		state: State,
//		event: Event
//) -> State {
//		switch event {
//		case FeedbackActions.increment:
//				return state.set(\.count, state.count + 1)
//		case FeedbackActions.decrement:
//				return state.set(\.count, state.count - 1)
//		}
//}
