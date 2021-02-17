//
//  AppDelegate.swift
//  MishiPay
//
//  Created by RajeshKumar on 17/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        checkDb()
        return true
    }
    
    
    func checkDb() {
        if (CoreDataManager.shared.fetchProducts().count < 2) {
            CoreDataManager.shared.insertDummyData(productId: "1368", title: "Super Blankets", pric: 999.00, image: "p1")
            CoreDataManager.shared.insertDummyData(productId: "1369", title: "Hot Wheels Car", pric: 599.00, image: "p2")
        }
    }
}

