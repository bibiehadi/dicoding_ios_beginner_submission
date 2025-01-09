//
//  ImageDownloaderModel.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 09/01/25.
//

import UIKit

class ImageDownloader: Operation {
    private let pokemon: PokemonModel
    
    init(pokemon: PokemonModel) {
        self.pokemon = pokemon
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let imageData = try? Data(contentsOf: self.pokemon.photo) else { return }
        
        if isCancelled {
            return
        }
        
        if !imageData.isEmpty {
            self.pokemon.imagePhoto = UIImage(data: imageData)
            self.pokemon.state = .downloaded
        } else {
            self.pokemon.imagePhoto = nil
            self.pokemon.state = .failed
        }
    }
}

class PendingOperations {
    lazy var downloadInProgress: [IndexPath: Operation] = [:]
    
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "xyz.pokedex.imagephotodownload"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
}
