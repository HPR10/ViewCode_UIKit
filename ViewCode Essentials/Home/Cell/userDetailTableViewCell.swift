import UIKit

class userDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "userDetailTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.contentView.addSubview(userImageView)
        self.contentView.addSubview(labelName)
    }
    
    public func setupCell(data: DataUser) {
        self.labelName.text = data.name
        self.userImageView.image = UIImage(named: data.nameImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.heightAnchor.constraint(equalToConstant: 80),
            self.userImageView.widthAnchor.constraint(equalToConstant: 80),
            
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
        ])
    }
    
}
