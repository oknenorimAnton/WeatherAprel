//
//  SceneDelegate.swift
//  WeatherAprel
//
//  Created by Антон on 02.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let sceneBuildManager = SceneBuildManager()
        
        window.rootViewController = sceneBuildManager.buildMainScene()
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
