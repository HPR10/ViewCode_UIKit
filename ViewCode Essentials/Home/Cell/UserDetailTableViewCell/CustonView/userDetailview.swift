import UIKit

class userDetailview: UIView {
        
    lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var labelName: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        return lb
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.addSubview(userImageView)
        self.addSubview(labelName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.heightAnchor.constraint(equalToConstant: 80),
            self.userImageView.widthAnchor.constraint(equalToConstant: 80),
            
            self.labelName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.labelName.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
        ])
    }
}
