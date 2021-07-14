//
//  Network.swift
//  practicingBackDrop
//
//  Created by Decagon on 10/07/2021.
//

import Foundation

class Network {
    
    static let shared = Network()
    var cat: [PetsModel]?
    var dataCompletion: (([PetsModel]) ->Void)?
    
    func requestForCats() {
        
        let headers = ["x-api-key": "api_key=1cf4a33c-3a76-42dc-97e1-c6f4a69ec1f8"]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.thecatapi.com/v1/breeds?attach_breed=0")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { [self] (data, response, error) -> Void in
            if (error != nil) {
                debugPrint(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                debugPrint(httpResponse as Any)
            }
            guard let data = data, error == nil else { return }
            var catsJson: [PetsModel]?
            do {
                catsJson = try JSONDecoder().decode([PetsModel].self, from: data)
            } catch {
                debugPrint(error)
            }
            guard let pets = catsJson else { return }
            dataCompletion?(pets)
            
        })
        
        dataTask.resume()
    }
    
    //    func requestForDogs() {
    //        let url = URL(string: "https://thedogapi.com")
    //
    //        URLSession.shared.dataTask(with: url!) { [self] data, response, error in
    //            guard let data = data, error == nil else { return }
    //        }
    //    }
}

//https://thecatapi.com/api_key=1cf4a33c-3a76-42dc-97e1-c6f4a69ec1f8
