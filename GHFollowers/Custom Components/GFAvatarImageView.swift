//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 07/03/25.
//

import UIKit

class GFAvatarImageView: UIImageView {

    let placeholder  = UIImage(resource: .avatarPlaceholder)
    let cache        = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true
        image              = placeholder
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else { return }
            guard let data else { return }
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }

}
