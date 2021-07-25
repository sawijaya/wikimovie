//
//  MovieDetailRouter.swift
//  wikimovie
//
//  Created by Salim Wijaya on 23/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MovieDetailRouter: IMovieDetailRouterIn {
	var interactor: IMovieDetailInteractorIn?
	var presenter: IMovieDetailModule?
	weak var view: IMovieDetailView?
    
}
