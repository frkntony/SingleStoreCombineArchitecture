//
//  globalStore.store.swift
//  SingleStoreCombineArchitecture
//
//  Created by Anton Elistratov on 04.01.2020.
//  Copyright © 2020 Anton Elistratov. All rights reserved.
//

import CombineFeedback
import CombineFeedbackUI
import SwiftUI

struct SingleStoreExampleView: View {
    let context: Context<State, Event>

    var body: some View {
//				FeedbackView(context: context.view(value: \.counter, event: Event.counter))
//						.navigationBarTitle(Text("Counter"))
			
		TabView {
			NavigationView {
					FeedbackView(context: context.view(value: \.counter, event: Event.counter))
							.navigationBarTitle(Text("Первый стейт"))
			}
			.tabItem {
					Image(systemName: "1.circle")
			}
			NavigationView {
					SecondFeedbackView(context: context.view(value: \.secondCounter, event: Event.secondCounter))
							.navigationBarTitle(Text("Второй стейт"))
			}
			.tabItem {
					Image(systemName: "2.circle")
			}
			}
    }
}

protocol Builder {}
extension Builder {
    func set<T>(_ keyPath: WritableKeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        copy[keyPath: keyPath] = value
        return copy
    }
}
