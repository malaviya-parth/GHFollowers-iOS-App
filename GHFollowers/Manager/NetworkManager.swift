//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 06/03/25.
//

import Foundation

class NetworkManager {
    
    // Making the class Singleton
    static let shared = NetworkManager()
    private init() {}
    
    let baseUrl = "https://api.github.com"
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=75&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, .invaliedUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, .invalidData)
                return
            }
        }
        
        task.resume()
    }
    
}
