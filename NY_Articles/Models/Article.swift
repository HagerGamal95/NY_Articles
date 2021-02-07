//
//  Article.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import Foundation
// MARK: - Result
struct Article: Codable {
    let uri: String?
    let url: String?
    let id, assetID: Int?
    let source: String?
    let publishedDate: Date?
    let updated, section: String?
    let subsection: String?
    let nytdsection, adxKeywords: String?
    let byline: String?
    let type: String?
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
