//
//  EndpointItem.swift
//
//  Created by Salim Wijaya on 07/11/20.
//

import Foundation
import Alamofire

protocol IEndpointType {
    var httpMethod: Alamofire.HTTPMethod { get }
    
    var path: String { get }
    
    var parameters: [String:Any]? { get }
    
    var encoding: Alamofire.ParameterEncoding { get }
    
    var httpHeaderFields: [String: Any] { get }
}

enum EndpointItem {
    typealias APIParameters = [String: Any]
    
    static let apiKey: String = "a3e6765afa6078cfecd3e425b06b1f34"

    static let BASE_URL: URL = URL(string: "https://api.themoviedb.org/3/")!

    static let TIMEOUTINTERVAL: TimeInterval = 60
    
    case movies(_ page: Int)
    
    case movie(_ id: Int)
    
    case movieCredit(_ id: Int)
}


extension EndpointItem: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        
        let baseURL = EndpointItem.BASE_URL.appendingPathComponent(self.path)
        
        let mutableUrlRequest = NSMutableURLRequest(url: baseURL)
        mutableUrlRequest.httpMethod = self.httpMethod.rawValue
        mutableUrlRequest.timeoutInterval = 30
        
        for (key, value) in self.httpHeaderFields {
            mutableUrlRequest.setValue(value as? String, forHTTPHeaderField: key)
        }
        print(baseURL)
        
        let urlRequest: URLRequest = mutableUrlRequest.copy() as! URLRequest
        print(urlRequest)
        let url = try encoding.encode(urlRequest as URLRequestConvertible, with: self.parameters).urlRequest!
        print(url)
        return url
    }
}

extension EndpointItem: IEndpointType {
    
    internal var httpHeaderFields: [String: Any] {
        return [:]
//        switch self {
//            default:
//                var _httpHeaderFields: [String: Any] = [:]
//                _httpHeaderFields["ContentType"] = "application/json" as AnyObject
//                _httpHeaderFields["Authorization"] = "Bearer #VALUE"
//
//                return _httpHeaderFields
//        }
    }
    
    internal var httpMethod: HTTPMethod {
        switch self {
            default: return .get
        }
    }
    
    internal var parameters: APIParameters? {
        switch self {
            case .movies(let page) :
                return ["api_key":EndpointItem.apiKey,"language":"en-US","page":page]
            default:
                return nil
        }
    }
    
    internal var path: String {
        switch self {
            case .movies:
                return "movie/popular"
            case .movie(let id):
                return "movie/\(id)"
            case .movieCredit(let id):
                return "movie/\(id)/credits"
        }
    }
    
    internal var encoding: ParameterEncoding {
        switch self {
            default:
                return URLEncoding.default
        }
    }
}
