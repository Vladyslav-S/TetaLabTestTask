//
//  NewsListItem+CoreDataProperties.swift
//  TetaLabTest
//
//  Created by MACsimus on 21.03.2023.
//
//

import Foundation
import CoreData


extension NewsListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsListItem> {
        return NSFetchRequest<NewsListItem>(entityName: "NewsListItem")
    }

    @NSManaged public var url: String?
    @NSManaged public var newsTitle: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var newsResource: String?
    @NSManaged public var newsDescription: String?

}

extension NewsListItem : Identifiable {

}
