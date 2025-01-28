//
//  ViewController.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 07/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        
        pokemonTableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "pokemonTableViewCell")
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonTableViewCell", for: indexPath) as? PokemonTableViewCell {
            let pokemon = pokemons[indexPath.row]
            cell.pokemonName.text = pokemon.name
            cell.pokemonImage.image = pokemon.imagePhoto
            cell.pokeTypeLabel.text = pokemon.type
            cell.pokeNumberLabel.text = pokemon.number
            cell.typeImageView.image = pokemon.typePhoto
//            if pokemon.type == "fire" {
//                cell.pokemonView.backgroundColor = UIColor(named: "FireColor")
//            } else if pokemon.type == "grass" {
//                cell.pokemonView.backgroundColor = UIColor(named: "GrassColor")
//            } else if pokemon.type == "water" {
//                cell.pokemonView.backgroundColor = UIColor(named: "WaterColor")
//            } else if pokemon.type == "electric" {
//                cell.pokemonView.backgroundColor = UIColor(named: "ElectricColor")
//            } else if pokemon.type == "poison" {
//                cell.pokemonView.backgroundColor = UIColor(named: "PoisonColor")
//            } else if pokemon.type == "ground" {
//                cell.pokemonView.backgroundColor = UIColor(named: "GroundColor")
//            } else if pokemon.type == "ice" {
//                cell.pokemonView.backgroundColor = UIColor(named: "IceColor")
//            } else if pokemon.type == "fairy" {
//                cell.pokemonView.backgroundColor = UIColor(named: "FairyColor")
//            } else if pokemon.type == "psychic" {
//                cell.pokemonView.backgroundColor = UIColor(named: "PsychicColor")
//            } else if pokemon.type == "steel" {
//                cell.pokemonView.backgroundColor = UIColor(named: "SteelColor")
//            } else {
//                cell.pokemonView.backgroundColor = UIColor(named: "FirstColor")
//            }
            
            if pokemon.state == .new {
                cell.loadingIndicator.isHidden = false
                cell.loadingIndicator.startAnimating()
                startDownload(pokemon: pokemon, indexPath: indexPath)
            }else {
                cell.loadingIndicator.stopAnimating()
                cell.loadingIndicator.isHidden = true
            }
            
            if pokemon.stateTypePhoto == .new {
                cell.loadingTypeIndicator.isHidden = false
                cell.loadingTypeIndicator.startAnimating()
            }else {
                cell.loadingTypeIndicator.stopAnimating()
                cell.loadingTypeIndicator.isHidden = true
            }
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
    fileprivate func startDownload(pokemon: PokemonModel, indexPath: IndexPath) {
        let imageDownloader = ImageDownloader()
        if pokemon.state == .new {
            Task {
                do {
                    let image = try await imageDownloader.downloadImage(url: pokemon.photo)
                    pokemon.state = .downloaded
                    pokemon.imagePhoto = image
                    self.pokemonTableView.reloadRows(at: [indexPath], with: .automatic)
                }catch {
                    pokemon.state = .failed
                    pokemon.imagePhoto = nil
                }
            }
        }
        if pokemon.stateTypePhoto == .new {
            Task {
                do {
                    let image = try await imageDownloader.downloadImage(url: pokemon.type_image)
                    pokemon.stateTypePhoto = .downloaded
                    pokemon.typePhoto = image
                    self.pokemonTableView.reloadRows(at: [indexPath], with: .automatic)
                }catch {
                    pokemon.stateTypePhoto = .failed
                    pokemon.typePhoto = nil
                }
            }
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: pokemons[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let pokeDetailViewController = segue.destination as? PokeDetailViewController {
                pokeDetailViewController.pokemon = sender as? PokemonModel
            }
        }
    }
}

//extension ViewController: UIScrollViewDelegate {
//  fileprivate func toggleSuspendOperations(isSuspended: Bool) {
//    pendingOperations.downloadQueue.isSuspended = isSuspended
//  }
//    
//  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//    toggleSuspendOperations(isSuspended: true)
//  }
// 
//  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//    toggleSuspendOperations(isSuspended: false)
//  }
//}
