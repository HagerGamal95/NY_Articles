//
//  ArticleService.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import Foundation
import Moya

enum ArticleService {
    
    case mostpopularSince(period: Int)
    
}

extension ArticleService: TargetType {
    
    var baseURL: URL {
        let baseUrl = R.String.BaseURL.baseUrl
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .mostpopularSince(let period):
            return "svc/mostpopular/v2/viewed/\(period).json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mostpopularSince(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .mostpopularSince(_):
            var params: [String: Any] = [:]
            params["api-key"] = R.String.ApiKey

            
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }

        }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    
}
