//
//  IMovieModule.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public protocol IMovieModule: class {
    func requestMovie(_ movie: Int)
    func requestMovieAt(page: Int)
}
