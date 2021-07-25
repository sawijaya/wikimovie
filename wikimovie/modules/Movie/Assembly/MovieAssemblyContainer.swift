//
//  MovieAssemblyContainer.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import Foundation
import Swinject
import UIKit

final class MovieAssemblyContainer: Assembly  {
    
    func assemble(container: Container) {
        
        container.register(IMovieInteractorIn.self) { (r, presenter: MoviePresenter) in
            let interactor: MovieInteractor = MovieInteractor()
            interactor.out = presenter
            let databaseService: MovieDatabaseService = MovieDatabaseService()
            let networkService: MovieNetworkService = MovieNetworkService()
            interactor.service = MovieService(databaseService: databaseService, networkService: networkService)
            return interactor
        }
        
        container.register(IMovieRouterIn.self) { (r, viewController: MovieViewController, presenter: MoviePresenter) in
            let router: MovieRouter = MovieRouter()
            router.presenter = presenter
            router.transitionHandler = viewController
            router.interactor = r.resolve(IMovieInteractorIn.self, argument: presenter)
            router.view = viewController
            
            return router
        }
        
        container.register(IMovieModule.self) { (r, viewController: MovieViewController) in
            let presenter: MoviePresenter = MoviePresenter()
            presenter.view = viewController
            presenter.interactor = r.resolve(IMovieInteractorIn.self, argument: presenter)
            presenter.router = r.resolve(IMovieRouterIn.self, arguments: viewController, presenter)
            return presenter
        }
        
        container.register(MovieViewController.self) { r in
            let viewController: MovieViewController = MovieViewController(nibName: "MovieViewController", bundle: Bundle.main)
            viewController.presenter = r.resolve(IMovieModule.self, argument: viewController)
            return viewController
        }
    }
    
}
