//
//  IMovieInteractorIn.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public protocol IMovieInteractorIn: class {
	func getMovie()
    func requestMovieAt(page: Int)
}
