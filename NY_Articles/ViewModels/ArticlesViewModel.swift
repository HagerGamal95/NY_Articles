//
//  ArticlesViewModel.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import Foundation

class ArticlesViewModel {
    
    fileprivate let service = ArticleDataService()
    
    var articles = [Article]()
    var message: String?
    
    func FetchArticles(with period: Int,completion: @escaping ((ViewModelState) -> Void)) {
        service.requestFetchArticles(with: 7) { (articles, error) in
            if let error = error {
                self.message = error.localizedDescription
                completion(.failure)
                return
            }
            self.articles = articles
            completion(.success)
        }
    }
    
}
