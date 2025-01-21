//
//  PokeDetailViewController.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 09/01/25.
//

import UIKit

class PokeDetailViewController: UIViewController {
    
    @IBOutlet var pokeDetailView: UIView!
    @IBOutlet weak var pokeTypeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeTypeLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeDescLabel: UILabel!
    
    @IBOutlet weak var pokeballImageView: UIImageView!
    var pokemon: PokemonModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let result = pokemon {
            pokeNameLabel.text = result.name
            pokeDescLabel.text = result.description
            pokeTypeLabel.text = result.type
            pokeImageView.image = result.imagePhoto
            pokeTypeImageView.image = result.typePhoto
            if result.type == "fire" {
                pokeDetailView.backgroundColor = UIColor(named: "FireColor")
            } else if result.type == "grass" {
                pokeDetailView.backgroundColor = UIColor(named: "GrassColor")
            } else if result.type == "water" {
                pokeDetailView.backgroundColor = UIColor(named: "WaterColor")
            } else if result.type == "electric" {
                pokeDetailView.backgroundColor = UIColor(named: "ElectricColor")
            } else if result.type == "poison" {
                pokeDetailView.backgroundColor = UIColor(named: "PoisonColor")
            } else if result.type == "ground" {
                pokeDetailView.backgroundColor = UIColor(named: "GroundColor")
            } else if result.type == "ice" {
                pokeDetailView.backgroundColor = UIColor(named: "IceColor")
            } else if result.type == "fairy" {
                pokeDetailView.backgroundColor = UIColor(named: "FairyColor")
            } else if result.type == "psychic" {
                pokeDetailView.backgroundColor = UIColor(named: "PsychicColor")
            } else if result.type == "steel" {
                pokeDetailView.backgroundColor = UIColor(named: "SteelColor")
            } else {
                pokeDetailView.backgroundColor = UIColor(named: "FirstColor")
            }
        }
    }
}
