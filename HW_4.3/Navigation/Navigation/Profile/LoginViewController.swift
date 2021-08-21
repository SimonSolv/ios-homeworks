//
//  LoginViewController.swift
//  Navigation
//
//  Created by Simon Pegg on 10.08.2021.
//
import Foundation
import UIKit

class LoginViewController: UIViewController {
    let mainView = UIScrollView()
    let contentView = UIView()
    let logoImageView: UIView = {
        let image: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        image.image = UIImage(imageLiteralResourceName: "VKlogo")
        image.sizeToFit()
        return image
    }()
    var loginButton: UIButton = {
        var btn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        btn.setBackgroundImage(UIImage(imageLiteralResourceName: "blue_pixel"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.addTarget(self , action: #selector(buttonPressed), for: .touchUpInside)
        btn.setTitle("Log in", for: .normal)
        return btn
    }()
    var loginTextField: UITextField = {
        var textfield: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        textfield.backgroundColor = .systemGray6
        textfield.layer.borderWidth = 0.5
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.font = .systemFont(ofSize: 16)
        textfield.textColor = .lightGray
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.text = "Email or phone"
        textfield.addTarget(self, action: #selector(passwordFieldTapped), for: .editingDidBegin)
        return textfield
    }()
    var passwordTextField: UITextField = {
        var textfield: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        textfield.backgroundColor = .systemGray6
        textfield.font = .systemFont(ofSize: 15)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.textColor = .lightGray
        textfield.text = "Password"
        textfield.addTarget(self, action: #selector(passwordFieldTapped), for: .editingDidBegin)
        textfield.addTarget(self, action: #selector(secureTypeOn), for: .editingDidBegin)
        return textfield
    }()
    var loginFieldsView: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    @objc func secureTypeOn(_ textField: UITextField){
        textField.isSecureTextEntry = true
    }
    @objc func buttonPressed() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: false)
        print("pressed")
    }
    @objc func passwordFieldTapped(_ textField: UITextField){
        textField.text = ""
        textField.textColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraits()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    func setupViews(){
        view.addSubview(mainView)
        mainView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginButton)
        contentView.addSubview(loginFieldsView)
        loginFieldsView.addSubview(loginTextField)
        loginFieldsView.addSubview(passwordTextField)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        loginFieldsView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.isUserInteractionEnabled = true
//        loginButton.isUserInteractionEnabled = true
    }
    func setupConstraits() {
            let constraints = [
            logoImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 120
            ),
            logoImageView.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor
            ),
            logoImageView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 220
            ),
            logoImageView.widthAnchor.constraint(
                equalToConstant: 100
            ),
            loginButton.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: 230
            ),
            loginButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -10)
            ,
            loginButton.heightAnchor.constraint(
                equalToConstant: 50
            ),
            passwordTextField.heightAnchor.constraint(
                equalToConstant: 50
            ),
            loginTextField.heightAnchor.constraint(
                equalToConstant: 50
            ),
            loginFieldsView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 340
            ),
            loginFieldsView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10
            ),
            loginFieldsView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10
            ),
            loginFieldsView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 440
            ),
            mainView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            mainView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            mainView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            mainView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            loginTextField.topAnchor.constraint(
                equalTo: loginFieldsView.topAnchor
            ),
            loginTextField.leadingAnchor.constraint(
                equalTo: loginFieldsView.leadingAnchor
            ),
            loginTextField.trailingAnchor.constraint(
                equalTo: loginFieldsView.trailingAnchor
            ),
            loginTextField.heightAnchor.constraint(
                equalToConstant: 50
            ),
            passwordTextField.topAnchor.constraint(
                equalTo: loginFieldsView.topAnchor,
                constant: 50
            ),
            passwordTextField.leadingAnchor.constraint(
                equalTo: loginFieldsView.leadingAnchor
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: loginFieldsView.trailingAnchor
            ),
            passwordTextField.heightAnchor.constraint(
                equalToConstant: 50
            ),
            contentView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            contentView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
                contentView.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor
                ),
                contentView.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor
                ),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
private extension LoginViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            mainView.contentInset.bottom = keyboardSize.height
            mainView.verticalScrollIndicatorInsets = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: keyboardSize.height,
                right: 0
            )
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        mainView.contentInset.bottom = .zero
        mainView.verticalScrollIndicatorInsets = .zero
    }
}
