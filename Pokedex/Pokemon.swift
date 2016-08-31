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
    private var _pokemonDescLbl: String!
    private var _pokemonTypeLbl: String!
    private var _defenseLbl: String!
    private var _heightLbl: String!
    private var _weightLbl: String!
    private var _attackLbl: String!
    private var _evolutionLbl: String!
    
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
