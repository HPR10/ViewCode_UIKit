import UIKit
import SnapKit

class userDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "userDetailTableViewCell"
    
    lazy var userDetailView: userDetailview = {
        let view = userDetailview()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.constraintsUserDetailView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.contentView.addSubview(userDetailView)
    }
    
    public func setupCell(data: DataUser) {
        self.userDetailView.labelName.text = data.name
        self.userDetailView.userImageView.image = UIImage(named: data.nameImage)
    }
    
    private func constraintsUserDetailView() {
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
