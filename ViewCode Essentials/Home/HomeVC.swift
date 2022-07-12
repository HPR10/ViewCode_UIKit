import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var dataUser: [DataUser] = [DataUser(name: "Bud", nameImage: "menino1"),
                            DataUser(name: "Jao", nameImage: "menino2"),
                            DataUser(name: "Pan", nameImage: "menina1")]
    
    var dataSport: [Sport] = [Sport(name: "running", nameImage: "running"),
                              Sport(name: "cycling", nameImage: "cycling"),
                              Sport(name: "yoga", nameImage: "yoga")]
    
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
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
        }
        
        let cell: userDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: userDetailTableViewCell.identifier, for: indexPath) as? userDetailTableViewCell
        cell?.setupCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
