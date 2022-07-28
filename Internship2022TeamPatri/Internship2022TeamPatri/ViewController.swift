//
//  ViewController.swift
//  Internship2022TeamPatri
//
//  Created by Szabolcs Orban on 25.07.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.text = "SnapKit label example"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add UI element to current view
        view.addSubview(label)
        
        // add constraints
        label.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(60)
            label.leading.equalToSuperview().offset(8)
            label.width.equalTo(200)
            label.height.equalTo(140)
        }
    }
}
