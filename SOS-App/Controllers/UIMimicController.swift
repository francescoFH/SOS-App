//
//  UIMimicController.swift
//  SOS-App
//
//  Created by Joshua Retallick on 24/01/2021.
//

import UIKit
import SwiftUI

class SecondViewController: UIViewController {
    
    let contentView = UIHostingController(rootView: HomeAPIContentView())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }


}
