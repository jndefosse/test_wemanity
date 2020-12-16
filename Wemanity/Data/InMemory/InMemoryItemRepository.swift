//
//  InMemoryItemRepository.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 15/12/2020.
//

import Foundation

class InMemoryItemRepository: ItemRepository {
    func updateQuality(items: [Item], completion: (Result<[Item], ItemError>) -> Void) {
        completion(.success(items.map({ (item) -> Item in
            let itemType = ItemType.convert(item: item)
            return itemType.updateItem(item: item)
        })))
    }
}
