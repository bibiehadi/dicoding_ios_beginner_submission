//
//  PokeDetailViewController.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 09/01/25.
//

import UIKit

class PokeDetailViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var pokeDetailView: UIView!
    @IBOutlet weak var pokeTypeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeTypeLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeDescLabel: UILabel!
    @IBOutlet weak var pokeSkillsTabelView: UITableView!
    @IBOutlet weak var pokeballImageView: UIImageView!
    
    var pokemon: PokemonModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let result = pokemon {
            pokeNameLabel.text = result.name + " \(result.number)"
            pokeDescLabel.text = result.description
            pokeTypeLabel.text = result.type
            pokeImageView.image = result.imagePhoto
            pokeTypeImageView.image = result.typePhoto
            if result.type == "fire" {
                pokeDetailView.backgroundColor = UIColor(named: "FireColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "FireColor")
            } else if result.type == "grass" {
                pokeDetailView.backgroundColor = UIColor(named: "GrassColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "GrassColor")
            } else if result.type == "water" {
                pokeDetailView.backgroundColor = UIColor(named: "WaterColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "WaterColor")
            } else if result.type == "electric" {
                pokeDetailView.backgroundColor = UIColor(named: "ElectricColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "ElectricColor")
            } else if result.type == "poison" {
                pokeDetailView.backgroundColor = UIColor(named: "PoisonColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "PoisonColor")
            } else if result.type == "ground" {
                pokeDetailView.backgroundColor = UIColor(named: "GroundColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "GroundColor")
            } else if result.type == "ice" {
                pokeDetailView.backgroundColor = UIColor(named: "IceColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "IceColor")
            } else if result.type == "fairy" {
                pokeDetailView.backgroundColor = UIColor(named: "FairyColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "FairyColor")
            } else if result.type == "psychic" {
                pokeDetailView.backgroundColor = UIColor(named: "PsychicColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "PsychicColor")
            } else if result.type == "steel" {
                pokeDetailView.backgroundColor = UIColor(named: "SteelColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "SteelColor")
            } else {
                pokeDetailView.backgroundColor = UIColor(named: "FirstColor")
                pokeSkillsTabelView.backgroundColor = UIColor(named: "FirstColor")
            }
            
            pokeSkillsTabelView.dataSource = self
            
            pokeSkillsTabelView.register(UINib(
                nibName: "PokemonSkillsTableViewCell", bundle: nil
            ), forCellReuseIdentifier: "SkillCell")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon?.skills.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "SkillCell",
            for: indexPath
        ) as? PokemonSkillsTableViewCell {
            
            let skill = pokemon?.skills[indexPath.row]
            cell.skillNameLabel.text = skill
            cell.skillImageView.image = pokemon?.typePhoto
            
            if pokemon?.type == "fire" {
                cell.backgroundColor = UIColor(named: "FireColor")
            } else if pokemon?.type == "grass" {
                cell.backgroundColor = UIColor(named: "GrassColor")
            } else if pokemon?.type == "water" {
                cell.backgroundColor = UIColor(named: "WaterColor")
            } else if pokemon?.type == "electric" {
                cell.backgroundColor = UIColor(named: "ElectricColor")
            } else if pokemon?.type == "poison" {
                cell.backgroundColor = UIColor(named: "PoisonColor")
            } else if pokemon?.type == "ground" {
                cell.backgroundColor = UIColor(named: "GroundColor")
            } else if pokemon?.type == "ice" {
                cell.backgroundColor = UIColor(named: "IceColor")
            } else if pokemon?.type == "fairy" {
                cell.backgroundColor = UIColor(named: "FairyColor")
            } else if pokemon?.type == "psychic" {
                cell.backgroundColor = UIColor(named: "PsychicColor")
            } else if pokemon?.type == "steel" {
                cell.backgroundColor = UIColor(named: "SteelColor")
            } else {
                cell.backgroundColor = UIColor(named: "FirstColor")
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

