//
//  CoreDataManager.swift
//  MishiPay
//
//  Created by RajeshKumar on 17/02/21.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared:CoreDataManager = CoreDataManager()
    var context:NSManagedObjectContext!
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MishiPay")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            }
        })
        return container
    }()
    
    private init(){
        context = persistentContainer.viewContext
    }
    
    
    
    
    
    

    

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error{
                
            }
        }
    }
    
    func insertDummyData(productId:String,title:String,pric:Double,image:String) {
        let entity = NSEntityDescription.entity(forEntityName: "Products", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(productId, forKey: "id")
        newUser.setValue(title, forKey: "title")
        newUser.setValue(pric, forKey: "price")
        newUser.setValue(image, forKey: "image")
        self.saveContext()
    }
    
    func fetchProducts() -> [Products]  {
        var records = [Products]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        do {
            records = try context.fetch(fetchRequest) as! [Products]
        } catch {
            print("Fetching Failed")
        }
        return records
    }
    func fetchProduct(withId:String)-> Products? {
        let id = withId
        var product:Products?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            product = (try self.context.fetch(fetchRequest) as! [Products]).first
        }catch {
            
        }
        return product
      }
    
}
