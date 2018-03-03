//
//  RestosViewController.swift
//  Restos
//
//  Created by Nina Yousefi on 3/1/18.
//  Copyright © 2018 Nina Yousefi. All rights reserved.
//

import Foundation
import UIKit

class RestosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, BranchServiceDelegate {
    
    @IBOutlet weak var restosCollectionView: UICollectionView!
    var dataArray: DTOBranchList?
    var branchService: BranchService?
    
    //var currentMovieViewController: MovieDetailsViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
    }

    func setContent() {
        branchService = BranchService(controller: self)
        branchService?.getRestos()
    }

    //MARK: MovieService Delegate
    func getBranchesList_Success(serviceResult: AnyObject) {
        if let restoList = serviceResult as? DTOBranchList {
            dataArray = restoList
            restosCollectionView.reloadData()
            //return
        }
    }

    func getBranchesList_Fail(error: Error?) {
        print("Error while getting Data...")
    }

    
    //MARK: Collection View Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = dataArray?.data, data.count > 0 {
            return (data.count)
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let resto = dataArray?.data?[indexPath.row] else {
            return UICollectionViewCell()
        }

        let cell = restosCollectionView.dequeueReusableCell(withReuseIdentifier: "RestoCollectionViewCell", for: indexPath) as! RestoCollectionViewCell
        cell.setContentWith(resto: resto)
        cell.layer.cornerRadius = 5
        return cell
    }
    
}
