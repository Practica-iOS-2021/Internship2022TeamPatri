//
//  HomeTabBarController.swift
//  Internship2022TeamPatri
//
//  Created by Vlad Silviu Hagiu on 04.08.2022.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewController()
        setTabBarItems()
    }
    
    private func setViewController() {
        let storyboard = UIStoryboard(name: "GradesView", bundle: nil)
        
        let gradesViewController = storyboard.instantiateViewController(withIdentifier: "GradesViewController")
        let gradesNavController = createNavigationController(viewController: gradesViewController, imageName: "grades")
        
        let coursesViewController = CoursesViewController.loadFromNib()
        let coursesNavController = createNavigationController(viewController: coursesViewController, imageName: "courses")
        
        let profileViewController = ProfileViewController()
        let profileNavController = createNavigationController(viewController: profileViewController, imageName: "profile")
        
        self.setViewControllers([gradesNavController, coursesNavController, profileNavController], animated: false)
    }
    
    private func createNavigationController(viewController: UIViewController, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        return navController
    }
    
    private func setTabBarItems() {
        tabBar.items?.forEach {
            $0.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            $0.selectedImage = UIImage(named: "Selected ")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        }
    }
    
}
