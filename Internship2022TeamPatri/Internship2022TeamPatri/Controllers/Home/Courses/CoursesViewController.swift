//
//  CoursesViewController.swift
//  Internship2022TeamPatri
//
//  Created by Eduard Sorin Caragea on 04.08.2022.
//

import UIKit

final class CoursesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet private var courseCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseCollectionView.dataSource = self
        courseCollectionView.delegate = self
        courseCollectionViewCells()
        navController(title: "Courses")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Course.mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: CoursesCollectionViewCell.identifier, for: indexPath) as! CoursesCollectionViewCell
        let course = Course.mock[indexPath.row]
        cell.setup(course: course)
        return cell
    }
    
    private func courseCollectionViewCells() {
        self.courseCollectionView.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: CoursesCollectionViewCell.identifier)
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

extension CoursesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width / 2.1
        return CGSize(width: width, height: 185)
    }
}
