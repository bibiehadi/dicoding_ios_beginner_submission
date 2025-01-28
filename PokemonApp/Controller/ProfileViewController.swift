//
//  ProfileViewController.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 28/01/25.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let imageURL = URL(string: "https://avatars.githubusercontent.com/u/29392494?v=4")!

        profileImageView.loadImage(from: imageURL, placeholder: UIImage(named: "profile photo"))
        
    }
}

extension UIImageView {
    func loadImage(from url: URL, placeholder: UIImage? = nil) {
        // Set placeholder image (if provided)
        self.image = placeholder
        
        // Fetch the image data asynchronously
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
