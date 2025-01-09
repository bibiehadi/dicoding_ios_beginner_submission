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
            
            if pokemon.state == .new {
                cell.loadingIndicator.isHidden = false
                cell.loadingIndicator.startAnimating()
                startDownload(pokemon: pokemon, indexPath: indexPath)
            }else {
                cell.loadingIndicator.stopAnimating()
                cell.loadingIndicator.isHidden = true
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
