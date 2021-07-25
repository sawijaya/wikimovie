//
//  MovieNetworkService.swift
//
//  Created by Salim Wijaya
//

import Foundation

protocol IMovieNetworkService {
//    func getMovie(handler: @escaping (Response<Movie>?) -> ())
    func requestMovieAt(page: Int, completion: @escaping (_ movies:[Movie], _ currentPage: Int, _ totalPage: Int) -> Void)
}

class MovieNetworkService: IMovieNetworkService {
    private let apiManager: APIManager = APIManager.shared()
    
    func requestMovieAt(page: Int, completion: @escaping ([Movie], Int, Int) -> Void) {
        self.apiManager.call(type: .movies(page)) { (response: Response<Movie>?) in
            completion(response?.results ?? [], response?.page ?? 0, response?.total_pages ?? 0)
        }
    }
}
