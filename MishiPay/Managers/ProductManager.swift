//
//  GetProductManager.swift
//  MishiPay
//
//  Created by RajeshKumar on 17/02/21.
//

import Foundation


class ProductManager {
    
    init() {
        
    }
    public func getProductId(fromQrCode:String) -> String {
        let splitedArray =  fromQrCode.components(separatedBy: "productId=")
        if splitedArray.count > 1 {
            return splitedArray[1]
        }
        return ""
    }
    
    
}

