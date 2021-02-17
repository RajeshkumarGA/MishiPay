//
//  ViewController.swift
//  MishiPay
//
//  Created by RajeshKumar on 17/02/21.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController {

    @IBOutlet weak var scannerView: QRScannerView!
    var productManager:ProductManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        productManager = ProductManager()
    }
    private func setupDelegate() {
        self.scannerView.delegate =  self
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        restartScanning()
        
    }
    
    private func restartScanning(){
        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
    
    func checkProductInDb(productId:String)-> Bool {
        if CoreDataManager.shared.fetchProduct(withId: productId) != nil {
            return true
        }
        return false
    }
    
    func showErrorAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { _ in
            
        }
        alert.addAction(action)
        DispatchQueue.main.async {
            self.navigationController?.present(alert, animated: true, completion: {
                self.restartScanning()
            })
        }
    }
        
    
}

extension ScannerViewController : QRScannerViewDelegate {
    func qrScanningDidFail() {
        showErrorAlert(title: "OOPS!", message: "Scanning Failed. Please try again.")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        if let productId = productManager?.getProductId(fromQrCode: str ?? "") {
            if checkProductInDb(productId:productId) {
                let productDetailsViewController =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
                productDetailsViewController.productId = productId
                self.navigationController?.pushViewController(productDetailsViewController, animated: true)
                return
            }
            showErrorAlert(title: "OOPS!", message: "Product is  not listed with us.")
        }
    }
    
    func qrScanningDidStop() {
        
    }
    
}


