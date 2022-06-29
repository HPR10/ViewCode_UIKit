import UIKit

protocol LoginScreenDelegate: AnyObject {
    func actionLogginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenDelegate?
    
    func delegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"logo")
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu e-mail  "
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha:"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedloginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta, Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.SetBackGround()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextfield)
        self.addSubview(self.passwordTextfield)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    private func SetBackGround() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextfield.delegate = delegate
        self.passwordTextfield.delegate = delegate
    }
    
    @objc private func tappedloginButton() {
        self.delegate?.actionLogginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
            self.emailTextfield.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextfield.topAnchor.constraint(equalTo: self.emailTextfield.bottomAnchor, constant: 15),
            self.passwordTextfield.leadingAnchor.constraint(equalTo: self.emailTextfield.leadingAnchor),
            self.passwordTextfield.trailingAnchor.constraint(equalTo: self.emailTextfield.trailingAnchor),
            self.passwordTextfield.heightAnchor.constraint(equalTo: self.emailTextfield.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextfield.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.passwordTextfield.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.passwordTextfield.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.passwordTextfield.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor)
        ])
    }
}
