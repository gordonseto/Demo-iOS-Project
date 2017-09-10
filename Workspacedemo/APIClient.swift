//
//  APIClient.swift
//  Workspacedemo
//
//  Created by Gordon Seto on 2017-09-10.
//  Copyright © 2017 gordonseto. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "http://pokeapi.co/api/v2"
    
    case getPokemon
    
    var method: HTTPMethod {
        switch self {
        case .getPokemon:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPokemon:
            return "/pokemon/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
    
        switch self {
        case .getPokemon:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: [:])
        }
        
        return urlRequest
    }
}

class APIClient {
    static let sharedClient = APIClient()
    
    private let sessionManager: SessionManager
    
    init() {
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        defaultHeaders["Content-Type"] = ""
        defaultHeaders["Accept"] = "application/json"
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        
        let longTaskConfiguration = URLSessionConfiguration.default
        longTaskConfiguration.httpAdditionalHeaders = defaultHeaders
        
        sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func request(_ request: URLRequestConvertible, completion: @escaping (Result<Any>) -> Void) {
        sessionManager.request(request).validate().responseJSON { (response) in
            completion(response.result)
        }
    }
}
