//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Simon Pegg on 22.07.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var status: String? = "Waiting for something..."
    var avatarImageView: UIView = {
        var circle: UIView = UIView()     
        circle.layer.cornerRadius = 107 / 2
        circle.backgroundColor = .white
        circle.clipsToBounds = true
        var border: UIView = UIView(frame: CGRect(x: 3, y: 3, width: 100, height: 100))
        border.layer.cornerRadius = border.frame.size.width / 2
        border.clipsToBounds = true
        var image: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 120))
        image.image = UIImage(imageLiteralResourceName: "ProfilePic")
        border.addSubview(image)
        circle.addSubview(border)
        return circle
    }()
    var fullNameLabel: UILabel = {
        var name: UILabel = UILabel(frame: CGRect(x: 150, y: 91+27, width: 300, height: 30))
        name.text = "Pajama Kid"
        name.font = .boldSystemFont(ofSize: 18)
        return name
    }()
    var statusLabel: UILabel = {
        var status: UILabel = UILabel(frame: CGRect(x: 150, y: 91+106-30, width: 300, height: 30))
        status.font = .systemFont(ofSize: 14)
        status.font = .boldSystemFont(ofSize: 18)
        status.textColor = .gray
        return status
    }()
    var statusTextField: UITextField = {
        var textfield: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 12
        textfield.layer.borderWidth = 1
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.font = .systemFont(ofSize: 15)
        textfield.textColor = .black
        textfield.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textfield
    }()
    
    var setStatusButton: UIButton = {
        var btn: UIButton = UIButton(frame: CGRect(x: 16, y: 0, width: 0, height: 50))
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 12
        btn.addTarget(self , action: #selector(buttonPressed), for: .touchUpInside)
        btn.setTitle("Set status", for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowRadius = 5
        btn.layer.shadowOpacity = 1.0
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = status
        statusTextField.frame = CGRect(x: statusLabel.frame.minX, y: statusLabel.frame.minY + 35, width: frame.width - statusLabel.frame.minX - 16, height: 40)
        setStatusButton.frame = CGRect(x: 16, y: statusTextField.frame.maxY + 16, width: frame.width-32, height: 50)
        backgroundColor = .lightGray
        addSubview(setStatusButton)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        [
            avatarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor ,
                constant: 16
            ),
            avatarImageView.trailingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16+107
            ),
            avatarImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor ,
                constant: 16
            ),
            avatarImageView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor  ,
                constant: 107+16
            ),
            fullNameLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor ,
                constant: 16
            ),
            fullNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor ,
                constant: -16
            ),
            fullNameLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor ,
                constant: 27
            ),
            fullNameLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor ,
                constant: 27+23
            ),
            statusLabel.leadingAnchor.constraint(
                equalTo: fullNameLabel.leadingAnchor
            ),
            statusLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor ,
                constant: -16
            ),
            statusLabel.topAnchor.constraint(
                equalTo: avatarImageView.bottomAnchor,
                constant: -35
            ),
            statusLabel.bottomAnchor.constraint(
                equalTo: avatarImageView.bottomAnchor ,
                constant: -10
            ),
            statusTextField.leadingAnchor.constraint(
                equalTo: fullNameLabel.leadingAnchor
            ),
            statusTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor ,
                constant: -16
            ),
            statusTextField.topAnchor.constraint(
                equalTo: statusLabel.bottomAnchor,
                constant: 10
            ),
            statusTextField.bottomAnchor.constraint(
                equalTo: statusLabel.bottomAnchor ,
                constant: 50
            ),
            setStatusButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            setStatusButton.trailingAnchor.constraint(
                equalTo: trailingAnchor ,
                constant: -16
            ),
            setStatusButton.topAnchor.constraint(
                equalTo: statusTextField.bottomAnchor,
                constant: 10
            ),
            setStatusButton.bottomAnchor.constraint(
                equalTo: setStatusButton.topAnchor ,
                constant: 50
            ),
        ]
        .forEach {
            $0.isActive = true
        }
    }
    @objc func statusTextChanged(_ textField: UITextField){
        status = textField.text
    }
    @objc func buttonPressed(){
        statusLabel.text = status
        statusTextField.text = ""
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


