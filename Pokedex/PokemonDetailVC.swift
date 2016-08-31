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
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonDescLbl: UILabel!
    @IBOutlet weak var pokemonTypeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var evolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pokemonNameLbl.text = pokemon.name.capitalized
    
    }
    
    @IBAction func musicBtnPressed(_ sender: AnyObject) {
        // TODO: MusicPlayerBtn
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
