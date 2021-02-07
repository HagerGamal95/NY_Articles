//
//  ArticleDataService.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import Foundation
import Moya

class ArticleDataService {
    
    fileprivate let provider = MoyaProvider<ArticleService>()
    
    func requestFetchArticles(with period: Int, completion: @escaping (([Article], Error?) -> Void)) {
        provider.request(.mostpopularSince(period: period)) { result in
            switch result {
            case .success(let response):
                do {
                    if let JSONString = String(data: response.data, encoding: String.Encoding.utf8)
                           {
                               print(JSONString)
                           }
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601

                    let base = try decoder.decode(BaseArticle.self, from: response.data)
                    completion(base.articles ?? [], nil)
                } catch (let error) {
                    completion([], error)
                }
            case .failure(let error):
                completion([], error)
            }
        }
    }
}
