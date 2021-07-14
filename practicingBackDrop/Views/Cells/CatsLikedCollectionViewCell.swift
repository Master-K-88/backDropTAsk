//
//  CatsLikedCollectionViewCell.swift
//  practicingBackDrop
//
//  Created by Decagon on 11/07/2021.
//

import UIKit
import Kingfisher

class CatsLikedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CatsLikedCollectionViewCell"
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    func populateColection(with model: CatModel) {
//        catImage.kf.setImage(with: model.image?.asUrl)
        
        catName.text = model.name
        
        let url = model.image?.asUrl
        let processor = DownsamplingImageProcessor(size: catImage?.bounds.size ?? CGSize(width: 150, height: 150))
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        catImage?.kf.indicatorType = .activity
        catImage?.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
}
