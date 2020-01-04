//
//  SecondFeedback.swift
//  SingleStoreCombineArchitecture
//
//  Created by Anton Elistratov on 04.01.2020.
//  Copyright © 2020 Anton Elistratov. All rights reserved.
//

import Combine
import CombineFeedback
import CombineFeedbackUI
import SwiftUI

extension SecondFeedback {
    final class ViewModel: CombineFeedbackUI.ViewModel<SecondFeedback.State, SecondFeedback.Event> {
        init() {
            super.init(
                initial: State(),
                feedbacks: [],
                scheduler: DispatchQueue.main,
                reducer: SecondFeedback.reducer(state:event:)
            )
        }
    }
}

struct SecondFeedbackView: View {
    typealias State = SecondFeedback.State
    typealias Event = SecondFeedback.Event
    
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

//extension View {
//    func eraseToAnyView() -> AnyView {
//        return AnyView(self)
//    }
//}
