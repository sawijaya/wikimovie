//
//  MovieDetailAssemblyContainer.swift
//  wikimovie
//
//  Created by Salim Wijaya on 23/07/21.
//  Copyright (c) 2021. All rights reserved.

import Foundation
import Swinject
import UIKit

final class MovieDetailAssemblyContainer: Assembly  {
    
    func assemble(container: Container) {
        
        container.register(IMovieDetailInteractorIn.self) { (r, presenter: MovieDetailPresenter) in
            let interactor: MovieDetailInteractor = MovieDetailInteractor()
            interactor.out = presenter
            return interactor
        }
        
        container.register(IMovieDetailRouterIn.self) { (r, viewController: MovieDetailViewController, presenter: MovieDetailPresenter) in
            let router: MovieDetailRouter = MovieDetailRouter()
            router.presenter = presenter
            
            router.interactor = r.resolve(IMovieDetailInteractorIn.self, argument: presenter)
            router.view = viewController
            
            return router
        }
        
        container.register(IMovieDetailModule.self) { (r, viewController: MovieDetailViewController) in
            let presenter: MovieDetailPresenter = MovieDetailPresenter()
            presenter.view = viewController
            presenter.interactor = r.resolve(IMovieDetailInteractorIn.self, argument: presenter)
            presenter.router = r.resolve(IMovieDetailRouterIn.self, arguments: viewController, presenter)
            return presenter
        }
        
        container.register(MovieDetailViewController.self) { r in
            let viewController: MovieDetailViewController = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: Bundle.main)
            viewController.presenter = r.resolve(IMovieDetailModule.self, argument: viewController)
            return viewController
        }
    }
    
}
