//
//  AgedItem.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 16/12/2020.
//

import Foundation

class AgedItem: ItemType {
    override func updateQuality(item: Item) {
        incrementQuality(item: item)
    }
    
    override func sellInIsExpired(item: Item) {
        incrementQuality(item: item)
    }
}
