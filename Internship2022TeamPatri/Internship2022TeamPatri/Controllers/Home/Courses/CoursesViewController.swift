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
        navigationItem.title = "Courses"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Course.mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as? CoursesCollectionViewCell {
            cell.setup(iconName: Course.mock[indexPath.row].iconName, title: Course.mock[indexPath.row].title)
            return cell
        }
        return UICollectionViewCell()
    }
    
    private func courseCollectionViewCells() {
        let textFieldCell = UINib(nibName: "CoursesCollectionViewCell", bundle: nil)
        self.courseCollectionView.register(textFieldCell, forCellWithReuseIdentifier: "CoursesCollectionViewCell")
    }
}
extension CoursesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width / 2.2
        return CGSize(width: width, height: 160)
    }
}
