//
//  Counter.swift
//  SingleStoreCombineArchitecture
//
//  Created by Anton Elistratov on 04.01.2020.
//  Copyright © 2020 Anton Elistratov. All rights reserved.
//

import Combine
import CombineFeedback
import CombineFeedbackUI
import SwiftUI

extension Feedback {
    final class ViewModel: CombineFeedbackUI.ViewModel<Feedback.State, Feedback.Event> {
        init() {
            super.init(
                initial: State(),
                feedbacks: [],
                scheduler: DispatchQueue.main,
                reducer: Feedback.reducer(state:event:)
            )
        }
    }
}

struct FeedbackView: View {
    typealias State = Feedback.State
    typealias Event = Feedback.Event
    
    let context: Context<State, Event>

    var body: some View {
        Form {
            Button(action: {
                self.context.send(event: .decrement)
            }) {
                return Text("-").font(.largeTitle)
            }
            Text("\(context.count)").font(.largeTitle)
            Button(action: {
                self.context.send(event: .increment)
            }) {
                Text("+").font(.largeTitle)
            }
        }
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
