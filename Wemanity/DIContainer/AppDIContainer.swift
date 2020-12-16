//
//  AppDIContainer.swift
//  Wemanity
//
//  Created by Jean-Nicolas DEFOSSE on 16/12/2020.
//

import Foundation

class AppDIContainer {
    class func makeUpdateItemsQualityUseCase() -> UpdateItemsQualityUseCase {
        return AppUpdateItemsQualityUseCase(repository: makeItemRepository())
    }
    
    internal class func makeItemRepository() -> ItemRepository {
        return InMemoryItemRepository()
    }
}
