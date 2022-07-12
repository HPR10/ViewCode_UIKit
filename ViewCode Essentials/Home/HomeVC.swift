import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var data: [DataUser] = [DataUser(name: "Bud", nameImage: "menino1"),
                            DataUser(name: "Jao", nameImage: "menino2"),
                            DataUser(name: "Pan", nameImage: "menina1")]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configureTableViewProtocols(delegate: self, datasource: self)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            return cell ?? UITableViewCell()
        }
        
        let cell: userDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: userDetailTableViewCell.identifier, for: indexPath) as? userDetailTableViewCell
        cell?.setupCell(data: self.data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
