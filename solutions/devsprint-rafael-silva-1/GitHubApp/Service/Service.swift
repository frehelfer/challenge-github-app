//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation
import UIKit

struct Service {
    
    func fetchUserRepositories(userName: String, completionHandler: @escaping (_ repositories: [Repository]?, _ error: Error?) -> ()) {
        guard let url = URL(string: "https://api.github.com/users/\(userName)/repos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("searching: \(userName)")
            guard
                error == nil,
                let data = data,
                let response = response as? HTTPURLResponse,
                200...299 ~= response.statusCode else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let repositories = try? decoder.decode([Repository].self, from: data) else { return }
            completionHandler(repositories, nil)
        }
        .resume()
    }
    
    func fetchUserImage(urlString: String, completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        guard
            urlString != "",
            let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data),
                let response = response as? HTTPURLResponse,
                200...299 ~= response.statusCode else {
                completionHandler(nil, error)
                return
            }
            
            completionHandler(image, nil)
        }
        .resume()
    }
}
