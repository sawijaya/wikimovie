//
//  MovieService.swift
//  wikimovie
//
//  Created by Salim Wijaya on 25/07/21.
//

import Foundation

protocol IMovieService {
    var databaseService: IMovieDatabaseService { get set }
    var networkService: IMovieNetworkService { get set }
    
    func requestMovieAt(page: Int, completion: @escaping (_ movies:[Movie], _ currentPage: Int, _ totalPage: Int) -> Void)
}

class MovieService: IMovieService {
    
    var databaseService: IMovieDatabaseService
    
    var networkService: IMovieNetworkService
    
    init(databaseService: IMovieDatabaseService, networkService: IMovieNetworkService) {
        self.databaseService = databaseService
        self.networkService = networkService
    }
    
    func requestMovieAt(page: Int, completion: @escaping ([Movie], Int, Int) -> Void) {
        let movies:[Movie] = self.databaseService.fetchMovieAtPage(page)
        if movies.count == 0 {
            self.networkService.requestMovieAt(page: page) { (movies, page, totalPage) in
                completion(movies, page, totalPage)
            }
        } else {
            completion(movies, page, -1)
        }
    }
}
