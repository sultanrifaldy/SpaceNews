//
//  ApiServices.swift
//  SpaceNews
//
//  Created by Sultan Rifaldy on 16/05/23.
//

import Foundation

class ApiServices {
    
    static let shared: ApiServices = ApiServices()
    private init () {}
    
    private let url = "https://api.spaceflightnewsapi.net/v3/articles"
    
    func loadNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        let urlString = url
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                } else {
                    if let data = data {
                        do {
                            let news = try JSONDecoder().decode([NewsModel].self, from: data)
                            completion(.success(news))
                        } catch let error {
                            completion(.failure(error))
                        }
                    } else {
                        completion(.success([]))
                    }
                }
            }
            task.resume()
        } else {
            completion(.success([]))
        }
    }
    
}
