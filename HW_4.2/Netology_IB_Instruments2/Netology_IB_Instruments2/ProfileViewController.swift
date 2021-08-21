//
//  ProfileViewController.swift
//  Netology_IB_Instruments2
//
//  Created by Simon Pegg on 14.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let profileViewName = String (describing: ProfileView.self)
        if let profileVeiw = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            profileVeiw.frame = CGRect(x: 20, y: 100, width: profileVeiw.bounds.width - 40, height: 500)
            view.addSubview(profileVeiw )
            profileVeiw.city.text = "Город"
        }
    }


}
