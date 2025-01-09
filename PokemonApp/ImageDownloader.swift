//
//  ImageDownloaderModel.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 09/01/25.
//

import UIKit

class ImageDownloader {
    func downloadImage(url: URL) async throws -> UIImage {
        async let imageData: Data = try Data(contentsOf: url)
        return UIImage(data: try await imageData)!
    }
}
