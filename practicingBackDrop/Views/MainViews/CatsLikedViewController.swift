//
//  CatsLikedViewController.swift
//  practicingBackDrop
//
//  Created by Decagon on 11/07/2021.
//

import UIKit

final class CatsLikedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var catLikedView: UICollectionView!
    private var viewModel = FavPetViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.async { [self] in
            catLikedView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.allFavPet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = catLikedView.dequeueReusableCell(withReuseIdentifier: CatsLikedCollectionViewCell.identifier, for: indexPath) as! CatsLikedCollectionViewCell
        let cat = viewModel.allFavPet[indexPath.row]
        cell.populateColection(with: cat)
        return cell
    }
    
    
}
