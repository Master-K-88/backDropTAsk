//
//  CatViewModel.swift
//  practicingBackDrop
//
//  Created by Decagon on 10/07/2021.
//

import Foundation

class CatViewModel {
    
    var dummyData = [FavCatModel]()
    var catDataCompletion: (() -> Void)?
    var catColletionData: (() -> Void)?
    var catLiked = [FavCatModel]()
    var dataBaseNames = [String]()
    
    private let petStorage: PersistenceService = FavPetStorage()
    
    func addFavPet(index: Int) {
        let newFavPet = dummyData[index]
        petStorage.addFavPet(pet: newFavPet)
        dummyData[index].isLiked = !dummyData[index].isLiked
    }
    
    func removeFavPet(index: Int) {
        let pet = dummyData[index]
        for oldPet in petStorage.allFavPet {
            if oldPet.name == pet.name {
                petStorage.removeFavPet(pet: oldPet)
            }
        }
        dummyData[index].isLiked = !dummyData[index].isLiked
    }
    init() {
        Network.shared.requestForCats()
        for cat in petStorage.allFavPet {
            dataBaseNames.append(cat.name)
        }
    }
    
    func catTableData() {
        Network.shared.dataCompletion = { [self] data in
            for item in data {
                if dataBaseNames.contains(item.name) {
                    dummyData.append(FavCatModel(name: item.name, image: item.image?.url, isLiked: true))
                } else {
                    dummyData.append(FavCatModel(name: item.name, image: item.image?.url, isLiked: false))
                }
            }
            catDataCompletion?()
        }
    }
    
    func updateCell(at index: Int) {
        if !dummyData[index].isLiked {
            addFavPet(index: index)
        } else if dummyData[index].isLiked {
            removeFavPet(index: index)
        }
        catDataCompletion?()
    }
}
