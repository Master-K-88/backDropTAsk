//
//  FavPetViewModel.swift
//  practicingBackDrop
//
//  Created by Decagon on 12/07/2021.
//

import Foundation

class FavPetViewModel {
    private let petStorage: PersistenceService = FavPetStorage()
    
    var allFavPet: [CatModel] {
        return petStorage.allFavPet.map { pet in
            return pet
        }
    }
}
