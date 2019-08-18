//
//  MobileDataModel+CoreDataProperties.swift
//  
//
//  Created by yuanchun tang on 18/8/2019.
//
//

import Foundation
import CoreData


extension MobileDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MobileDataModel> {
        return NSFetchRequest<MobileDataModel>(entityName: "MobileDataModel")
    }

    @NSManaged public var volumeOfMobileData: String?
    @NSManaged public var quarter: String?

}
