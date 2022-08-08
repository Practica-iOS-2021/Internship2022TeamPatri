//
//  CoursesCollectionViewCell.swift
//  Internship2022TeamPatri
//
//  Created by Eduard Sorin Caragea on 04.08.2022.
//

import UIKit
import SnapKit

class CoursesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseIcon: UIImageView!
    @IBOutlet weak var courseButon: UIButton!
    
    func setup(iconName: String, title: String) {
        courseIcon.image = UIImage(named: iconName)
        courseName.text = title
        courseName.font = courseName.font.withSize(16)
        containerView.backgroundColor = UIColor.themeColor
        containerView.layer.cornerRadius = 20
        courseButon.backgroundColor = UIColor.white
        courseButon.layer.cornerRadius = 20
        contentView.addSubview(containerView)
        containerView.addSubview(courseName)
        containerView.addSubview(courseIcon)
        containerView.addSubview(courseButon)
        styleCell()
    }
}

private extension CoursesCollectionViewCell {
    func styleCell() {
        contentView.layoutMargins = UIEdgeInsets(top: 14, left: 10, bottom: 0, right: 10)
        
        containerView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(contentView.layoutMargins)
        }
        
        courseName.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
            make.centerX.equalTo(containerView)
        }
        
        courseIcon.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(50)
            make.centerX.equalTo(courseName.snp.centerX)
            make.top.equalTo(courseName.snp.bottom).offset(10)
        }
        
        courseButon.snp.makeConstraints { make in
            make.top.equalTo(courseIcon.snp.bottom).offset(10)
            make.centerX.equalTo(courseIcon.snp.centerX)
            make.height.equalTo(37)
            make.width.equalTo(120)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
