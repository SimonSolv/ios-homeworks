import UIKit

class ProfileHeaderView: UIView {
    var status: String? = "Waiting for something..."
    var avatarImageView: UIView = {
        var image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ProfilePic")
        image.layer.cornerRadius = 107/2
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = CGColor(srgbRed: 100, green: 100, blue: 100, alpha: 100)
        return image
    }()
    var fullNameLabel: UILabel = {
        var name: UILabel = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Pajama Kid"
        name.font = .boldSystemFont(ofSize: 18)
        return name
    }()
    var statusLabel: UILabel = {
        var status: UILabel = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = .systemFont(ofSize: 14)
        status.font = .boldSystemFont(ofSize: 18)
        status.textColor = .gray
        return status
    }()
    var statusTextField: UITextField = {
        var textfield: UITextField = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
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
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
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
        translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = status
        backgroundColor = .lightGray
        addSubview(setStatusButton)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        [
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor ,constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: leadingAnchor,constant: 16+107),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor ,constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor ,constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 23),
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -35),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -10),
            
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor ,constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor ,constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor,constant: 10),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
//            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
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


