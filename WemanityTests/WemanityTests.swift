//
//  WemanityTests.swift
//  WemanityTests
//
//  Created by Jean-Nicolas DEFOSSE on 15/12/2020.
//

import XCTest
@testable import Wemanity

class WemanityTests: XCTestCase {
    let updateItemsQualityUseCase = AppUpdateItemsQualityUseCase(repository: InMemoryItemRepository())
    
    // MARK: - Item
    func test_Item_Rule_Quality_Decrease() {
        let items = [Item(name: "Items", sellIn: 1, quality: 2)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(0, items[0].sellIn)
                XCTAssertEqual(1, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    func test_Item_Rule_Quality_Min() {
        let items = [Item(name: "Items", sellIn: 1, quality: 0)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(0, items[0].sellIn)
                XCTAssertEqual(0, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    // MARK: - Aged Brie
    
    func test_AgedBrie_Rule_Quality() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(1, items[0].sellIn)
                XCTAssertEqual(1, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    func test_AgedBrie_Rule_Quality_Sell_In_Passed() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 40)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(-1, items[0].sellIn)
                XCTAssertEqual(42, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    func test_AgedBrie_Rule_Max_Quality() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 50)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(-1, items[0].sellIn)
                XCTAssertEqual(50, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }

    // MARK: - Backstage passes
    
    func test_Backstage_passes_Rule_Increase() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 12, quality: 40)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(11, items[0].sellIn)
                XCTAssertEqual(41, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    func test_Backstage_passes_Rule_Increase_Twice() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 40)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(9, items[0].sellIn)
                XCTAssertEqual(42, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    func test_Backstage_passes_Rule_Increase_Three_Time() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 40)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(4, items[0].sellIn)
                XCTAssertEqual(43, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    func test_Backstage_passes_Rule_Drop_Zero() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 40)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(-1, items[0].sellIn)
                XCTAssertEqual(0, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    // MARK: - Sulfuras
    
    func test_Sulfuras_no_effect() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 8, quality: 80)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(8, items[0].sellIn)
                XCTAssertEqual(80, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
    
    // MARK: - Conjured
    func test_Conjured_Decrease() {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 8, quality: 10)]
        let request = UpdateItemsQualityRequest(items: items)
        updateItemsQualityUseCase.execute(request: request) { (result) in
            switch result {
            case .success(let items):
                XCTAssertEqual(7, items[0].sellIn)
                XCTAssertEqual(8, items[0].quality)
            case .failure(let error):
                XCTFail("Update failed: \(error)")
            }
        }
    }
}
