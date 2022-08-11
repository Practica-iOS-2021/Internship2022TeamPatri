//
//  CoursesCollectionViewCell.swift
//  Internship2022TeamPatri
//
//  Created by Eduard Sorin Caragea on 04.08.2022.
//

import UIKit
import SnapKit

class CoursesCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    let containerView = UIView()
    let courseName = UILabel()
    let courseIcon = UIImageView(image: nil)
    let courseButton = UIButton()
    
    func setup(course: Course){
        courseIcon.image = UIImage(named: course.name)
        courseName.text = course.name
        courseName.font = courseName.font.withSize(17)
        courseButton.backgroundColor = UIColor.white
        courseButton.layer.cornerRadius = 15
        containerView.backgroundColor = UIColor.themeColor
        containerView.layer.cornerRadius = 20
        
        contentView.addSubview(containerView)
        containerView.addSubview(courseName)
        containerView.addSubview(courseIcon)
        containerView.addSubview(courseButton)
        styleCell()
    }
}

private extension CoursesCollectionViewCell {
    func styleCell() {
        contentView.layoutMargins = UIEdgeInsets(top: 30, left: 10, bottom: 0, right: 10)
        
        containerView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(contentView.layoutMargins)
        }
        
        courseName.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
            make.centerX.equalTo(containerView)
        }
        
        courseIcon.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(55)
            make.centerX.equalTo(courseName.snp.centerX)
            make.top.equalTo(courseName.snp.bottom).offset(10)
        }
        
        courseButton.snp.makeConstraints { make in
            make.top.equalTo(courseIcon.snp.bottom).offset(10)
            make.centerX.equalTo(courseIcon.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(125)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

