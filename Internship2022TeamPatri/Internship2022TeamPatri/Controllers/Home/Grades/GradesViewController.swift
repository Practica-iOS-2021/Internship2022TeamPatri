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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Grade.mock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = Grade.mock[indexPath.row]
        return CustomTableViewCell(course: Grade(iconName: course.iconName, title: course.title, grade: course.grade))
    }
}
