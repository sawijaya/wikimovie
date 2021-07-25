//
//  MovieRouter.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MovieRouter: IMovieRouterIn {
	var interactor: IMovieInteractorIn?
	var presenter: IMovieModule?
	weak var view: IMovieView?
    var transitionHandler: TransitionHandler?
    
    public func presentMovieDetail(){
        try? self.transitionHandler?.forCurrentModule(module: Module.movieDetail, to: IMovieDetailModule.self)
            .transition(animate: true)
            .apply(to: { (viewController) in
                
            })
            .to(preferred: TransitionStyle.navigation(style: .push))
            .then({ (moduleInput) in
                
            })
    }
}
