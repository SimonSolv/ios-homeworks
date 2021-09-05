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
        let image: UIImageView = UIImageView()
        image.image = UIImage(named: "VKlogo")
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var loginButton: UIButton = {
        var btn: UIButton = UIButton()
        btn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        btn.setTitle("Log in", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
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
        textfield.translatesAutoresizingMaskIntoConstraints = false
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
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.addTarget(self, action: #selector(passwordFieldTapped), for: .editingDidBegin)
        textfield.addTarget(self, action: #selector(secureTypeOn), for: .editingDidBegin)
        return textfield
    }()
    var inputSourceView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.axis = .vertical
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
        print (mainView.bounds.height)
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
       // mainView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginButton)
        contentView.addSubview(inputSourceView)
        inputSourceView.addSubview(loginTextField)
        inputSourceView.addSubview(passwordTextField)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

    }
    func setupConstraits() {
        let constraints = [
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                        
            contentView.topAnchor.constraint(equalTo: mainView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
                        
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 450),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            inputSourceView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 340),
            inputSourceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            inputSourceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            inputSourceView.heightAnchor.constraint(equalToConstant: 100),

            loginTextField.topAnchor.constraint(equalTo: inputSourceView.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: inputSourceView.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: inputSourceView.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: inputSourceView.topAnchor,constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: inputSourceView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: inputSourceView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

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
                bottom: keyboardSize.height - 80,
                right: 0
            )
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        mainView.contentInset.bottom = .zero
        mainView.verticalScrollIndicatorInsets = .zero
    }
}
