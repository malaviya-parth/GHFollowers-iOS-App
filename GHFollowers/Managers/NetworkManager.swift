//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 06/03/25.
//

import UIKit

class NetworkManager {
    
    // Making the class Singleton
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrl = "https://api.github.com"
    let cache = NSCache<NSString, UIImage>()
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
        
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=75&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                        completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, ErrorMessage>) -> Void) {
        
        let endpoint = baseUrl + "/users/\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                        completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
}
