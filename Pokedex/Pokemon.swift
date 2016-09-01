//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jonathan Uttankar on 26/08/16.
//  Copyright © 2016 Jonathan Uttankar. All rights reserved.
//

import Foundation
import Alamofire

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
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    private var _pokemonURL: String!
    
    var pokemon: Pokemon!
    
    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = ""
        }
        return _nextEvolutionLevel
    }
    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionName: String {
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        return _nextEvolutionName
    }
    
    var descLbl: String {
        if _pokemonDescLbl == nil {
            _pokemonDescLbl = ""
        }
        return _pokemonDescLbl
    }
    
    var typeLbl: String {
        if _pokemonTypeLbl == nil {
            _pokemonTypeLbl = ""
        }
        return _pokemonTypeLbl
    }
    
    var defenseLbl: String {
        if _defenseLbl == nil {
            _defenseLbl = ""
        }
        return _defenseLbl
    }
    
    var heightLbl: String {
        if _heightLbl == nil {
            _heightLbl = ""
        }
        return _heightLbl
    }
    
    var weightLbl: String {
        if _weightLbl == nil {
            _weightLbl = ""
        }
        return _weightLbl
    }
    
    var attackLbl: String {
        if _attackLbl == nil {
            _attackLbl = ""
        }
        return _attackLbl
    }
    
    var evolutionLbl: String {
        if _evolutionLbl == nil {
            _evolutionLbl = ""
        }
        return _evolutionLbl
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: downloadComplete) {
        
        Alamofire.request(_pokemonURL, withMethod: .get).responseJSON { (response) in
        
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weightLbl = weight
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attackLbl = "\(attack)"
                }
                
                if let height = dict["height"] as? String {
                    self._heightLbl = height
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defenseLbl = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    if let name = types[0]["name"] {
                        self._pokemonTypeLbl = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._pokemonTypeLbl! += "/\(name.capitalized)"
                            }
                        }
                    }
                    
                } else {
                    self._pokemonTypeLbl = ""
                }
                
                if let descarr = dict["descriptions"] as? [Dictionary<String, String>] , descarr.count > 0 {
                    if let url = descarr[0]["resource_uri"] {
                        let descUrl = "\(URL_BASE)\(url)"
                        
                        Alamofire.request(descUrl, withMethod: .get).responseJSON(completionHandler: { (response) in
                            if let dictDesc = response.result.value as? Dictionary<String, AnyObject> {
                                if let description = dictDesc["description"] as? String {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self._pokemonDescLbl = newDescription
                                }
                            }
                            
                            completed()

                        })
                        
                    }
                } else {
                    self._pokemonDescLbl = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] , evolutions.count > 0 {
                    if let nextEvo = evolutions[0]["to"] as? String {
                        
                        if nextEvo.range(of: "mega") == nil {
                            self._nextEvolutionName = nextEvo
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let newEvoId = newStr.replacingOccurrences(of: "/", with: "")
                                self._nextEvolutionId = newEvoId
                                
                                if let lvlExist = evolutions[0]["level"] {
                                    if let lvl = lvlExist as? Int {
                                        self._nextEvolutionLevel = "\(lvl)"
                                    }
                                } else {
                                    self._nextEvolutionLevel = ""
                                }
                            }
                            
                        }
                        
                    }
                }
            }
            
            completed()
            
        }
    }
    
    
}
