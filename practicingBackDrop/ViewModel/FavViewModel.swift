//
//  FavViewModel.swift
//  practicingBackDrop
//
//  Created by Decagon on 11/07/2021.
//

import UIKit
import RealmSwift

class CatModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var image: String? = ""
    @objc dynamic var isLiked: Bool = false
}

