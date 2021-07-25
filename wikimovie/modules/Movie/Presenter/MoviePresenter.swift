//
//  MoviePresenter.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MoviePresenter: IMovieModule {
    
	
	var interactor: IMovieInteractorIn?
	var router: IMovieRouterIn?
	weak var view: IMovieView?
	public var parameters: [String: Any]?
	
	public init() {
        
	}
    
    public func requestMovie(_ movie: Int) {
        self.router?.presentMovieDetail()
        self.interactor?.getMovie()
    }
    
    public func requestMovieAt(page: Int) {
        self.interactor?.requestMovieAt(page: page)
    }
    
}

extension MoviePresenter: IMovieInteractorOut {
    public func loadMovies(_ movies: [Movie], currentPage: Int, totalPage: Int) {
        self.view?.loadMovies(movies, currentPage: currentPage, totalPage: totalPage)
    }
}
