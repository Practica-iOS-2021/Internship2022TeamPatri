//
//  AppDelegate.swift
//  Internship2022TeamPatri
//
//  Created by Szabolcs Orban on 25.07.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AuthApiManagerDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        resetRoot()
        AuthApiManager.sharedInstance.delegate = self
        return true
    }
    
    func getRootViewController() -> UIViewController {
        if AuthApiManager.sharedInstance.isLoggedIn {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let tabBar = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController")
            return tabBar
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LogInViewController")
            return loginViewController
        }
    }
    
    func resetRoot() {
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
    }
    func didLogIn() {
        resetRoot()
    }
}
