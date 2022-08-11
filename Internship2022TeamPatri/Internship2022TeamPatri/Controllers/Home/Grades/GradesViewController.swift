//
//  ViewController.swift
//  UIGrades
//
//  Created by Eduard Sorin Caragea on 26.07.2022.
//

import UIKit

class GradesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        navController(title: "Grades")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Course.mock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = Course.mock[indexPath.row]
        return CustomTableViewCell(course: Course(iconName: course.iconName, title: course.title, grade: course.grade))
    }
    
    // making the customized navigation controller
    public func navController(title: String) {
        // adding the bottom shadow
        let shadowView = UIView(frame: self.navigationController!.navigationBar.frame)
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.22
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowView.layer.shadowRadius = 3
        self.view.addSubview(shadowView)
        
        // adding the title
        let lbNavTitle = UILabel (frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        lbNavTitle.textColor = UIColor.colorText
        lbNavTitle.numberOfLines = 0
        lbNavTitle.center = CGPoint(x: 0, y: 0)
        lbNavTitle.textAlignment = .center
        lbNavTitle.text = title
        lbNavTitle.font = lbNavTitle.font.withSize(32)
        self.navigationItem.titleView = lbNavTitle
    }
}
