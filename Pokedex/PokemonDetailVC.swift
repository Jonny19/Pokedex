//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Jonathan Uttankar on 31/08/16.
//  Copyright © 2016 Jonathan Uttankar. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    @IBOutlet weak var pokemonNameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pokemonNameLbl.text = pokemon.name
    
    }
    
    @IBAction func musicBtnPressed(_ sender: AnyObject) {
        // TODO: MusicPlayerBtn
    }

}
