//
//  CollectionViewCell.swift
//  Cocktail
//
//  Created by spark-04 on 2024/02/28.
//

import UIKit
import Alamofire
import AlamofireImage

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cocktailImage: UIImageView!
    
    func configure(with url: URL) {
            AF.request(url).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    self?.cocktailImage.image = image
                case .failure(_):
                    self?.cocktailImage.image = nil
                }
            }
        }
}
