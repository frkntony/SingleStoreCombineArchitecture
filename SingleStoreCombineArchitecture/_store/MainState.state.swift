//
//  MainState.swift
//  SingleStoreCombineArchitecture
//
//  Created by Anton Elistratov on 04.01.2020.
//  Copyright © 2020 Anton Elistratov. All rights reserved.
//

import Combine
import CombineFeedback
import CombineFeedbackUI
import Foundation



enum Event {
	case counter(Feedback.Event)
	case secondCounter(SecondFeedback.Event)

	var counter: Feedback.Event? {
			get {
					guard case let .counter(value) = self else { return nil }
					return value
			}
			set {
					guard case .counter = self, let newValue = newValue else { return }
					self = .counter(newValue)
			}
	}
	
	var secondCounter: SecondFeedback.Event? {
			get {
					guard case let .secondCounter(value) = self else { return nil }
					return value
			}
			set {
					guard case .secondCounter = self, let newValue = newValue else { return }
					self = .secondCounter(newValue)
			}
	}
	
	
}

let countReducer: Reducer<State, Event> = pullback(
    Feedback.reducer,
    value: \.counter,
    event: \.counter
)

let secondCountReducer: Reducer<State, Event> = pullback(
    SecondFeedback.reducer,
    value: \.secondCounter,
    event: \.secondCounter
)

/* общий стейт */
struct State: Builder {
	var counter = Feedback.State()
	var secondCounter = SecondFeedback.State()
}

/* общий редусер */
let appReducer = combine(
    countReducer,
		secondCountReducer
)
