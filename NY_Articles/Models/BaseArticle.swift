//
//  BaseArticle.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import Foundation

// MARK: - Base
struct BaseArticle: Codable {
    let status, copyright: String?
    let numResults: Int?
    let articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults
        case articles = "results"
    }
}
