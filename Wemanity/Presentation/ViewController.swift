//
//  ViewController.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 15/12/2020.
//

import UIKit

class ViewController: UIViewController {
    var items = [
        Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
        Item(name: "Aged Brie", sellIn: 2, quality: 0),
        Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        Item(name: "Conjured Mana Cake", sellIn: 8, quality: 18)
    ]
    
    let updateItemsQualityUseCase = AppDIContainer.makeUpdateItemsQualityUseCase()

    override func viewDidLoad() {
        super.viewDidLoad()

        let days = 10;

        for i in 0..<days {
            print("-------- day \(i) --------")
            print("name, sellIn, quality")
            for item in items {
                print(item)
            }
            print("")
        
            let request = UpdateItemsQualityRequest(items: self.items)
            self.updateItemsQualityUseCase.execute(request: request) { (result) in
                switch result {
                case .success(let items):
                    self.items = items
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

