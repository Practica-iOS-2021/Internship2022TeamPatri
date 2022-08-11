//
//  CustomTableViewCell.swift
//  UIGrades
//
//  Created by Eduard Sorin Caragea on 26.07.2022.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    let containerView = UIView()
    let iconImageView = UIImageView(image: nil)
    let title = UILabel()
    let grade = UILabel()
    
    init(course: Grade) {
        iconImageView.image = UIImage(named: course.iconName)
        title.text = course.title
        title.font = title.font.withSize(20)
        grade.text = course.grade
        grade.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = UIColor.themeColor
        
        super.init(style: .default, reuseIdentifier: nil)
        
        contentView.addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(title)
        containerView.addSubview(grade)
        
        applyLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomTableViewCell {
    func applyLayout() {
        contentView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    
        containerView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(contentView.layoutMargins)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(16)
            make.leading.equalTo(containerView).offset(16)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalToSuperview().inset(16)
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(35)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
        
        grade.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalTo(title.snp.centerY)
        }
    }
}

