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
        
        let storyboard = UIStoryboard(name: "GradesView", bundle: nil)
        let gradesViewController = storyboard.instantiateViewController(withIdentifier: "GradesViewController")
        
        let navController = UINavigationController()
        let coursesViewController = CoursesViewController.loadFromNib()
        navController.pushViewController(coursesViewController, animated: false)
        let profileViewController = ProfileViewController()
        
        self.setViewControllers([ gradesViewController,navController, profileViewController], animated: false)
        setTabBarItems()
    }
    
    func setTabBarItems(){
        let gradesViewController = (self.tabBar.items?[0])! as UITabBarItem
        gradesViewController.image = UIImage(named: "grades")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        gradesViewController.selectedImage = UIImage(named: "Selected ")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        gradesViewController.title = ""
        gradesViewController.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let coursesViewController = (self.tabBar.items?[1])! as UITabBarItem
        coursesViewController.image = UIImage(named: "courses")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        coursesViewController.selectedImage = UIImage(named: "Selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        coursesViewController.title = ""
        coursesViewController.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let profileViewController = (self.tabBar.items?[2])! as UITabBarItem
        profileViewController.image = UIImage(named: "profile")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        profileViewController.selectedImage = UIImage(named: "Selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        profileViewController.title = ""
        profileViewController.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}
