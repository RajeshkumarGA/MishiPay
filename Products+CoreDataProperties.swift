//
//  Products+CoreDataProperties.swift
//  MishiPay
//
//  Created by RajeshKumar on 17/02/21.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var image: String?

}

extension Products : Identifiable {

}
