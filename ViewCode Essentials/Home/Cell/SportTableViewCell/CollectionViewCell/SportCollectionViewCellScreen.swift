import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var sportName: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.textColor = .darkGray
        return lb
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.addSubview(self.imgView)
        self.addSubview(self.sportName)
    }
    
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.imgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.imgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.imgView.bottomAnchor.constraint(equalTo: self.sportName.topAnchor, constant: -10),
            
            self.sportName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.sportName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.sportName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.sportName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
