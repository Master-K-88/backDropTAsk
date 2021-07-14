//
//  CartsModel.swift
//  practicingBackDrop
//
//  Created by Decagon on 10/07/2021.
//

import Foundation

// MARK: - CatsModel
struct PetsModel: Codable {
    let id, name: String
    let image: Image?
}

// MARK: - Image
struct Image: Codable {
    let url: String?
}
