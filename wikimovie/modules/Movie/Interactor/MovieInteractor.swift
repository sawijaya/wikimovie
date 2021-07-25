//
//  MovieInteractor.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MovieInteractor: IMovieInteractorIn {
	var out: IMovieInteractorOut?
    var service: MovieService?
    
	public init() {

	}
    
    public func requestMovieAt(page: Int) {
        print(#file, #function)
        print(page)
        self.service?.requestMovieAt(page: page, completion: { (movies, currentPage, totalPage) in
            self.out?.loadMovies(movies, currentPage: currentPage, totalPage: totalPage)
        })
    }
    
    public func getMovie() {
//        let n: MovieNetworkService = MovieNetworkService()
//        n.getMovie { (movie) in
//            print(movie)
//        }
//        print("DATABASEEEE")
//        let d: MovieDatabaseService = MovieDatabaseService()
//        print(d.fetchFromStorage())
//        n.get
    }
}
