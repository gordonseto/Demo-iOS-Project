//
//  Pokemon.swift
//  Workspacedemo
//
//  Created by Gordon Seto on 2017-09-10.
//  Copyright © 2017 gordonseto. All rights reserved.
//

import Foundation

class Pokemon {
    var name: String!
    var weight: Int!
    var baseExperience: Int!
    
    init(name: String, weight: Int, baseExperience: Int){
        self.name = name
        self.weight = weight
        self.baseExperience = baseExperience
    }
    
    init(name: String){
        self.name = name
    }
}
