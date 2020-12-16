//
//  BackstagePassItem.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 16/12/2020.
//

import Foundation

class BackstagePassItem: ItemType {
    override func updateQuality(item: Item) {
        incrementQuality(item: item)
        
        if (item.sellIn <= 10) {
            incrementQuality(item: item)
        }

        if (item.sellIn <= 5) {
            incrementQuality(item: item)
        }
    }
    
    override func sellInIsExpired(item: Item) {
        item.quality = 0
    }
}
