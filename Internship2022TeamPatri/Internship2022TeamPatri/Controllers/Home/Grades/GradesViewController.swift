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
        return data.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = data[indexPath.row]
        let courses = Course(iconName: cell.iconName, title: cell.title, grade: cell.grade)
        return CustomTableViewCell(course: courses)
    }
}
