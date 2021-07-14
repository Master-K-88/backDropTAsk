//
//  PersistenceService.swift
//  practicingBackDrop
//
//  Created by Decagon on 12/07/2021.
//

import Foundation
import RealmSwift

protocol PersistenceService {
    func addFavPet(pet: FavCatModel)
    func removeFavPet(pet: CatModel)
    var allFavPet: Results<CatModel> { get }
}

class FavPetStorage: PersistenceService {
    private let realm: Realm!
    
    
    
    init() {
        realm = try! Realm()
    }
    
    var allFavPet: Results<CatModel> {
        return realm.objects(CatModel.self)
    }
    
    func addFavPet(pet: FavCatModel) {
        let cat = CatModel()
        cat.name = pet.name
        cat.image = pet.image
        cat.isLiked = pet.isLiked
        
        try! realm.write {
            self.realm.add(cat)
        }
    }
    
    func removeFavPet(pet: CatModel) {
        try! realm.write {
            self.realm.delete(pet)
        }
    }
    
    func testFunc() {
        
    }
    
}
