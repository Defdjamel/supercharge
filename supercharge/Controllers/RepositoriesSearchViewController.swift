//
//  RepositoriesSearchViewController.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RepositoryTableViewCell"

class RepositoriesSearchViewController: UIViewController {
    // MARK: - Variable
    var repositories : [Repository] = []
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        pullDataFromNetwork()
    }
    func initUI(){
        self.tableView.register(UINib.init(nibName: reuseIdentifier, bundle: Bundle.main), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func pullDataFromNetwork(){
        Loader.show()
        NetworkManager.sharedInstance.searchRepositories(q: "+language:swift", page: 0, success: { (items) in
            self.repositories = items
            self.tableView.reloadData()
            Loader.dismiss()
            
        }) {
            Loader.showError(withStatus: "error pull Data!")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UITableViewDataSource
extension RepositoriesSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath) as! RepositoryTableViewCell
       cell.setInterface(repositories[indexPath.row])
        return cell
    }
}
//MARK: - UITableViewDelegate
extension RepositoriesSearchViewController:   UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
