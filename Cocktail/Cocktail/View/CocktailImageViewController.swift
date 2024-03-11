//
//  ViewController.swift
//  Cocktail
//
//  Created by spark-04 on 2024/02/28.
//

import UIKit
import Foundation
import AlamofireImage
import Alamofire

struct CocktailData: Codable {
    let name: String
    let imageURLs: [String]
}

class ViewController: UIViewController, UICollectionViewDataSource {
    
    let parser = CocktailDataParser()
    var dataArray:String?
    var selectedBase: String?
    var imageURLs: [URL] = []
    var selectedIndex = 0
    
    @IBOutlet weak var cocktailCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cocktailCollection.dataSource
        fetchCocktailData()
    }
    
    
    func fetchCocktailData() {
        Task {
            do {
                if let selectedBase = selectedBase {
                    let jsonURL = URL(string: "https://nanayama.shop/cocktail/\(selectedBase)/list.json")!
                    let imageURLs = try await parser.getImageURLs(from: jsonURL)
                    self.imageURLs = imageURLs

                    DispatchQueue.main.async {
                        self.cocktailCollection.reloadData()
                    }
                }
            } catch {
                print("Error parsing JSON from \(imageURLs): \(error.localizedDescription)")
            }
            print(imageURLs)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageURLs[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail",
           let indexPath = cocktailCollection.indexPathsForSelectedItems?.first,
           let destinationVC = segue.destination as? CocktailDetailViewController {
            destinationVC.imageURLs = imageURLs
            destinationVC.selectedIndex = indexPath.row
            print(imageURLs)
        }
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCell: CGFloat = 2
        let cellWidth = UIScreen.main.bounds.size.width / numberOfCell - 2
        collectionView.contentMode = .scaleAspectFill
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
