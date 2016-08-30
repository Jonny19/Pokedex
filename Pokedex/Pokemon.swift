//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jonathan Uttankar on 26/08/16.
//  Copyright © 2016 Jonathan Uttankar. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    
    var pokemon: Pokemon!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
    
}
