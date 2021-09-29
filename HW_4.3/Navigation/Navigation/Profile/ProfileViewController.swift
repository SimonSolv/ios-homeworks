import UIKit

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        var table = UITableView()
        table.frame = .zero
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let cellID = "CellID"
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
//        tapGesture.numberOfTapsRequired = 1
//        tapGesture.numberOfTouchesRequired = 1
        view.backgroundColor = .lightGray
        setupTableView()
        setupConstraints()
        }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraints() {
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
//    @objc func tap() {
//        
//        print ("tapped")
//    }

}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostStorage.tableModel[section].body.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return PostStorage.tableModel.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return PostStorage.tableModel[section].sectionHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PostTableViewCell
        cell?.post = PostStorage.tableModel[indexPath.section].body[indexPath.row]
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
 
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return PostStorage.tableModel[section].footer
    }
}
