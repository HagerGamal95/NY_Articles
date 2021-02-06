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

// MARK: - Result
struct Article: Codable {
    let uri: String?
    let url: String?
    let id, assetID: Int?
    let source: Source?
    let publishedDate, updated, section: String?
    let subsection: String?
    let nytdsection, adxKeywords: String?
    let byline: String?
    let type: ResultType?
    let title, abstract: String?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID
        case source
        case publishedDate
        case updated, section, subsection, nytdsection
        case adxKeywords
        case byline, type, title, abstract
        case desFacet
        case orgFacet
        case perFacet
        case geoFacet
        case media
        case etaID
    }
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType?
    let subtype: Subtype?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: Format?
    let height, width: Int?
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum Subsection: String, Codable {
    case empty = ""
    case music = "Music"
    case politics = "Politics"
}

enum ResultType: String, Codable {
    case article = "Article"
}
