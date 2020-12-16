//
//  ItemRepository.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 15/12/2020.
//

import Foundation

enum ItemError: Error {
    
}

protocol ItemRepository {
    func updateQuality(items: [Item], completion: (Result<[Item], ItemError>) -> Void)
}
