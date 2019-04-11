//
//  DetailCollectionViewController.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit

private let reuseIdentifierTitleCell = "DetailTitleCollectionViewCell"
private let reuseIdentifierDescriptionCell = "DetailDescriptionCollectionViewCell"
private let reuseIdentifierNumberCell = "DetailNumberCollectionViewCell"


class DetailCollectionViewController: UICollectionViewController {
    var currentRepository : Repository!
    var arrayNumberRepository : [NumberRepository] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell Nib
        self.collectionView!.register(UINib.init(nibName: reuseIdentifierTitleCell, bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifierTitleCell)
         self.collectionView!.register(UINib.init(nibName: reuseIdentifierDescriptionCell, bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifierDescriptionCell)
         self.collectionView!.register(UINib.init(nibName: reuseIdentifierNumberCell, bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifierNumberCell)

        // Do any additional setup after loading the view.
        setupUI()
        initArrayNumberRepository()
        self.collectionView.reloadData()
    }
    
    

    private func setupUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.title = currentRepository.title
    }
    
     // MARK: - DATA
    private func initArrayNumberRepository(){
        //score
        let score = NumberRepository.init(name: "Score", count: String.init(format: "%1.1f", Float(currentRepository.score)), icon_name: iconType.score)
        arrayNumberRepository.append(score)
        //fork
        let fork = NumberRepository.init(name: "Fork", count: "\(currentRepository.forks)", icon_name: nil)
        arrayNumberRepository.append(fork)
        //open Issu
        let openIssue = NumberRepository.init(name: "Open Issues", count: "\(currentRepository.open_issues)", icon_name: iconType.open_issue)
        arrayNumberRepository.append(openIssue)
        //fork
        let watcher = NumberRepository.init(name: "Watchers", count: "\(currentRepository.watchers)", icon_name: nil)
        arrayNumberRepository.append(watcher)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

   

}


extension DetailCollectionViewController {
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        switch section {
        case 2:// return 4 cell for number
            return arrayNumberRepository.count
        default:
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierTitleCell, for: indexPath)
                as! DetailTitleCollectionViewCell
            // Configure the cell
            cell.setInterface(currentRepository)
             return cell
        }
       
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierDescriptionCell, for: indexPath)
                as! DetailDescriptionCollectionViewCell
            // Configure the cell
            cell.setInterface(currentRepository)
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierNumberCell, for: indexPath)
                as! DetailNumberCollectionViewCell
            // Configure the cell
            cell.setNumberRepository(arrayNumberRepository[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell.init()
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}
//MARK: - UICollectionViewDelegateFlowLayout
extension DetailCollectionViewController: UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 0 {
            let widthCollection = UIScreen.main.bounds.width
            return CGSize(width: widthCollection, height: 320)
        }
       else if indexPath.section == 1 {
            let widthCollection = UIScreen.main.bounds.width
            return CGSize(width: widthCollection, height: 140)
        }
        else if indexPath.section == 2 {
            let widthCollection = UIScreen.main.bounds.width
            return CGSize(width: widthCollection / 2 , height: 140)
        }
       return CGSize.zero
    
    }
    
}
