//
//  PokemonService.swift
//  Workspacedemo
//
//  Created by Gordon Seto on 2017-09-10.
//  Copyright © 2017 gordonseto. All rights reserved.
//

import Foundation
import Alamofire

class PokemonService {
    
    static func getPokemon(completion: @escaping ([Pokemon])->()) {
        // Hit the API, construct Pokemon
        APIClient.sharedClient.request(Router.getPokemon) { (response) in
            switch response {
            case .success(let value):
                let json = value as! [String: Any]
                let results = json["results"] as! [[String: Any]]
                
                let pokemons = results.map({ (json) -> Pokemon in
                    let name = json["name"] as! String
                    let pokemon = Pokemon(name: name)
                    return pokemon
                })
                completion(pokemons)
            case .failure(let error):
                print(error)
            }
        }

    }
    
}
