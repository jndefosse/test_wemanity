//
//  ItemType.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 16/12/2020.
//

import Foundation

class ItemType {
    class func convert(item: Item) -> ItemType {
        switch item.name {
        case "Aged Brie":
            return AgedItem()
        case "Backstage passes to a TAFKAL80ETC concert":
            return BackstagePassItem()
        case "Sulfuras, Hand of Ragnaros":
            return LegendaryItem()
        case "Conjured Mana Cake":
            return ConjuredItem()
        default:
            return ItemType()
        }
    }
    
    func incrementQuality(item: Item) {
        if item.quality < 50 {
            item.quality = item.quality + 1
        }
    }
    
    func decrementQuality(item: Item) {
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
    }
    
    func updateQuality(item: Item) {
        decrementQuality(item: item)
    }
    
    func updateSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
        
        if item.sellIn < 0 {
            sellInIsExpired(item: item)
        }
    }
    
    func sellInIsExpired(item: Item) {
        decrementQuality(item: item)
    }
    
    func updateItem(item: Item) -> Item {
        updateQuality(item: item)
        
        updateSellIn(item: item)
        
        return item
    }
}
