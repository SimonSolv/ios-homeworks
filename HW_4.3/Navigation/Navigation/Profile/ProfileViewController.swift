//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Simon Pegg on 22.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .lightGray
        let mainView = ProfileHeaderView()
        view.addSubview(mainView)
        let lowButton: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .black
            btn.setTitle("New button", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            return btn
            
        }()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        lowButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lowButton)
        [
            mainView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            mainView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            mainView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            mainView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 220
            ),
            lowButton.leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor
            ),
            lowButton.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor
            ),
            lowButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            lowButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -50
            )
        ]
        .forEach {
            $0.isActive = true
        }
    }

}
