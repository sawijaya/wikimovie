//
//  MovieDetailPresenter.swift
//  wikimovie
//
//  Created by Salim Wijaya on 23/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MovieDetailPresenter: IMovieDetailModule {
	
	var interactor: IMovieDetailInteractorIn?
	var router: IMovieDetailRouterIn?
	weak var view: IMovieDetailView?
	public var parameters: [String: Any]?
	
	public init() {
	}
}

extension MovieDetailPresenter: IMovieDetailInteractorOut {
	
}
