//
//  CocktailListViewController.swift
//  Cocktail
//
//  Created by spark-04 on 2024/02/28.
//

import UIKit
import Foundation

class CocktailListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataArray = ["gin1", "vodka2", "tequila3", "rum4", "whisky5", "brandy6", "liqueur7", "wine8", "beer9", "nonalcoholic0"]
    var cocktailDataArray: [CocktailData] = []
    var selectedBase: String?
    
    @IBOutlet weak var baseList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseList.dataSource = self
        baseList.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "TimesNewRomanPSMT", size: 18)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.contentView.frame.size.width = 400
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollection",
           let indexPath = baseList.indexPathForSelectedRow,
           let destination = segue.destination as? ViewController {
            destination.selectedBase = dataArray[indexPath.row]
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
