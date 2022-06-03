import UIKit

class RegisterScreen: UIView {
    
    lazy var btBack: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "back"), for: .normal)
        return bt
    }()
    
    lazy var imgLogo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "perfil")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    // MARK: - Setup / Layout
    
    private func configSuperView() {
        self.addSubview(self.btBack)
        self.addSubview(self.imgLogo)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.imgLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imgLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imgLogo.widthAnchor.constraint(equalToConstant: 150),
            self.imgLogo.heightAnchor.constraint(equalToConstant: 150),
            
            self.btBack.topAnchor.constraint(equalTo: self.imgLogo.topAnchor),
            self.btBack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
             
        ])
    }
   
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setConfigBackgroundColor()
        self.configSuperView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfigBackgroundColor() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
}
