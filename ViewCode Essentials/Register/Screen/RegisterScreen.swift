import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    
     func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }

    lazy var btBack: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "back"), for: .normal)
        bt.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var imgLogo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "perfil")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var emailTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = . white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu e-mail"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var PasswordTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = . white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Cadastrar", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        bt.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        bt.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return bt
    }()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setConfigBackgroundColor()
        self.configSuperView()
        self.setupConstraints()
        self.configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    // MARK: - Setup / Layout
    
    private func configSuperView() {
        self.addSubview(self.btBack)
        self.addSubview(self.imgLogo)
        self.addSubview(self.emailTextfield)
        self.addSubview(self.PasswordTextfield)
        self.addSubview(self.registerButton)
    }
    
    private func setConfigBackgroundColor() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    // Escutando alguma atividade nos textFields
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextfield.delegate = delegate
        self.PasswordTextfield.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validatextfield() {
        let email: String = self.emailTextfield.text ?? ""
        let password: String = self.PasswordTextfield.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
        
    }
    
    private func configButtonEnable(_ enable: Bool){
        if enable {
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.isEnabled = true
        } else {
            registerButton.setTitleColor(.lightGray, for: .normal)
            registerButton.isEnabled = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.imgLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imgLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imgLogo.widthAnchor.constraint(equalToConstant: 150),
            self.imgLogo.heightAnchor.constraint(equalToConstant: 150),
            
            self.btBack.topAnchor.constraint(equalTo: self.imgLogo.topAnchor),
            self.btBack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            
            self.emailTextfield.topAnchor.constraint(equalTo: self.imgLogo.bottomAnchor, constant: 20),
            self.emailTextfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            self.PasswordTextfield.topAnchor.constraint(equalTo: self.emailTextfield.bottomAnchor, constant: 15),
            self.PasswordTextfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.PasswordTextfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.PasswordTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            self.registerButton.topAnchor.constraint(equalTo: self.PasswordTextfield.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerButton.heightAnchor.constraint(equalToConstant: 45),
             
        ])
    }

}
