//
//  NewsModel.swift
//  SpaceNews
//
//  Created by Sultan Rifaldy on 16/05/23.
//

import Foundation


struct NewsModel: Decodable {
    let title: String
    let url: String
    let imageUrl: String
    let summary: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case imageUrl
        case summary
    }
    
}
