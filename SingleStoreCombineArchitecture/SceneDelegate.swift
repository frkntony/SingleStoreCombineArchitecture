//
//  SceneDelegate.swift
//  SingleStoreCombineArchitecture
//
//  Created by Anton Elistratov on 04.01.2020.
//  Copyright © 2020 Anton Elistratov. All rights reserved.
//

import CombineFeedbackUI
import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = makeSingleStoreExample()
        self.window = window
        window.makeKeyAndVisible()
    }

    private func makeSingleStoreExample() -> UIViewController {
        return UIHostingController(
            rootView: Widget(
                viewModel: ViewModel(
                    initial: State(),
                    feedbacks: [],
                    scheduler: DispatchQueue.main,
                    reducer: appReducer
                ),
                render: SingleStoreExampleView.init
            )
        )
    }
}
