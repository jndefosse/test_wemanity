//
//  ConjuredItem.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 16/12/2020.
//

import Foundation

class ConjuredItem: ItemType {
    override func updateQuality(item: Item) {
        super.updateQuality(item: item)
        decrementQuality(item: item)
    }
    
    override func sellInIsExpired(item: Item) {
        super.sellInIsExpired(item: item)
        decrementQuality(item: item)
    }
}
