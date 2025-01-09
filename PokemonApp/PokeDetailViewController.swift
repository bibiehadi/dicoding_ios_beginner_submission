//
//  PokeDetailViewController.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 09/01/25.
//

import UIKit

class PokeDetailViewController: UIViewController {
    
    @IBOutlet weak var pokeTypeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeTypeLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeDescLabel: UILabel!
    
    var pokemon: PokemonModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = pokemon {
            pokeNameLabel.text = result.name
            pokeDescLabel.text = result.description
            pokeTypeLabel.text = result.type
            pokeImageView.image = result.imagePhoto
        }
    }
}
