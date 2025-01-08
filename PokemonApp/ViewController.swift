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
            cell.loadingIndicator.startAnimating()
            return cell
        }else {
            return UITableViewCell()
        }
    }
}
