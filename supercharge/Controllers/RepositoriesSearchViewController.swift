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
    private var repositories : [Repository] = []
    //var for pagination
    private var currentPage : Int = 0
    private var isLoading  = false
    private var hasMoreAvailable = true
    
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
        if isLoading{
            return
        }
        Loader.show()
        isLoading = true
        
        NetworkManager.sharedInstance.searchRepositories(q: "+language:swift", page: currentPage, success: { (items) in
            self.hasMoreAvailable = items.count >= maxCount ? true : false
            self.repositories.append(contentsOf: items)
            self.tableView.reloadData()
            Loader.dismiss()
             self.isLoading = false
            
        }) {
            Loader.showError(withStatus: "error pull Data!")
             self.isLoading = false
        }
    }
    /** showMoreRecipes is called only when user scroll to last cell
     */
    private func showMoreRecipes(){
        currentPage += 1
        pullDataFromNetwork()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? DetailCollectionViewController, let indexSelected = tableView.indexPathForSelectedRow{
            vc.currentRepository = repositories[indexSelected.row]
        }
    }
    

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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == repositories.count {
            //Show more item if has available
            if hasMoreAvailable{
                showMoreRecipes()
            }
        }
    }
}
//MARK: - UITableViewDelegate
extension RepositoriesSearchViewController:   UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "homeToDetail", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
