//
//  CatTableViewCell.swift
//  practicingBackDrop
//
//  Created by Decagon on 10/07/2021.
//

import UIKit
import Kingfisher

protocol CatTableViewCellDelegate: AnyObject {
    func likeBtnTapped(tag: Int)
}

class CatTableViewCell: UITableViewCell {
    
    weak var delegate: CatTableViewCellDelegate?
    
    static let identifier = "CatTableViewCell"
    @IBOutlet weak var catImage: UIImageView?
    @IBOutlet weak var catName: UILabel?
    @IBOutlet weak var likeButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        // invoke superclass implementation
        super.prepareForReuse()
        
        // reset the likeButton
        self.likeButton?.imageView?.image = UIImage(systemName: "heart")
        self.likeButton?.tintColor = .systemGray
        
    }
    
    @IBAction func newLikeButton(_ sender: UIButton) {
        delegate?.likeBtnTapped(tag: sender.tag)
    }
    
    func catPopulate(with model: FavCatModel) {
        populateCell(isLiked: model.isLiked)
        self.catName?.text = model.name
        
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
        
//        catImage?.kf.setImage(with: model.image?.asUrl)
    }
    
    func populateCell(isLiked: Bool) {
        if isLiked {
            likeButton?.imageView?.image = UIImage(systemName: "heart.fill")
            likeButton?.tintColor = .red
        } else {
            likeButton?.imageView?.image = UIImage(systemName: "heart")
            likeButton?.tintColor = .systemGray
        }
    }
}
