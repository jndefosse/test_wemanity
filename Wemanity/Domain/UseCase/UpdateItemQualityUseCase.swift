//
//  UpdateUpdateItemQualityUsecase.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 15/12/2020.
//  
//

import Foundation

protocol UpdateItemsQualityUseCase{
    func execute(request: UpdateItemsQualityRequest, _ completion: (Result<[Item], ItemError>) -> Void)
}


final class AppUpdateItemsQualityUseCase: UpdateItemsQualityUseCase {
    var repository: ItemRepository
    
    init(repository: ItemRepository) {
        self.repository = repository
    }
    
    func execute(request: UpdateItemsQualityRequest, _ completion: (Result<[Item], ItemError>) -> Void) {
        repository.updateQuality(items: request.items, completion: completion)
    }
}

struct UpdateItemsQualityRequest {
    var items: [Item]
}
