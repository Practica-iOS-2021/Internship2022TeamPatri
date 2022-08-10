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
        
        let coursesViewController = CoursesViewController.loadFromNib()
        let navController = UINavigationController(rootViewController: coursesViewController)
        let profileViewController = ProfileViewController()
        
        self.setViewControllers([ gradesViewController,navController, profileViewController], animated: false)
    }
    
    func setTabBarItems() {
        setItem(imageName: "grades", tabBarItem: tabBar.items?[0])
        setItem(imageName: "courses", tabBarItem: tabBar.items?[1])
        setItem(imageName: "profile", tabBarItem: tabBar.items?[2])
    }
    
    private func setItem(imageName: String, tabBarItem: UITabBarItem?){
        guard let tabBarItem = tabBarItem else {
            return
        }
        tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItem.selectedImage = UIImage(named: "Selected ")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
    
}
