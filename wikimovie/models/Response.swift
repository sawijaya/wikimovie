//
//  Response.swift
//  wikimovie
//
//  Created by Salim Wijaya on 25/07/21.
//

import Foundation

struct Response<T:Codable>: Codable {
    var page: Int?
    var results: [T]?
    var total_result: Int?
    var total_pages: Int?
}

