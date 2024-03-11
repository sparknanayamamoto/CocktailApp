//
//  WebViewController.swift
//  Cocktail
//
//  Created by spark-04 on 2024/02/28.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    let url = "https://nanayama.shop/"
    
    @IBOutlet weak var cocktailWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: url) {
            let urlRequest = URLRequest(url: url)
            cocktailWebView.load(urlRequest)
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
