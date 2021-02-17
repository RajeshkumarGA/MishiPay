//
//  ScannedViewController.swift
//  MishiPay
//
//  Created by RajeshKumar on 17/02/21.
//

import UIKit

struct Item{
    var productTitle : String
    var price : Double
    var image : UIImage?
}

class ProductDetailsViewController: UIViewController {
    var productId:String!
    var item:Products?

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productIdlabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductFromDb()
    }
    
    
    private func getProductFromDb() {
        if let item = CoreDataManager.shared.fetchProduct(withId: productId) {
            DispatchQueue.main.async {
                self.nameLabel.text = item.title
                self.productImage.image = UIImage(named: item.image ?? "p1")
                self.priceLabel.text = "Rs.\(item.price)"
            }
            return
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    

    

}
