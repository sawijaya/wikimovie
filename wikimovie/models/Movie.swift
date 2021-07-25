//
//  Movie.swift
//  wikimovie
//
//  Created by Salim Wijaya on 25/07/21.
//

import Foundation
import CoreData

public extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

@objc(Movie)
public final class Movie: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case release_date
        case vote_average
        case popularity
        case overview
        case backdrop_path
        case poster_path
        case id
        case vote_count
    }

    // MARK: - Core Data Managed Object
    @NSManaged public var title: String?
    @NSManaged public var release_date: String?
    @NSManaged public var vote_average: Double
    @NSManaged public var popularity: Double
    @NSManaged public var overview: String?
    @NSManaged public var backdrop_path: String?
    @NSManaged public var poster_path: String?
    @NSManaged public var id: Int64
    @NSManaged public var vote_count: Double

    // MARK: - Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedObjectContext) else {
            fatalError("Failed to decode Movie")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 0
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.id = try container.decodeIfPresent(Int64.self, forKey: .id) ?? -1
        self.vote_count = try container.decodeIfPresent(Double.self, forKey: .vote_count) ?? 0
        self.vote_average = try container.decodeIfPresent(Double.self, forKey: .vote_average) ?? 0
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(release_date, forKey: .release_date)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(overview, forKey: .overview)
        try container.encode(backdrop_path, forKey: .backdrop_path)
        try container.encode(poster_path, forKey: .poster_path)
        try container.encode(id, forKey: .id)
        try container.encode(vote_count, forKey: .vote_count)
        try container.encode(vote_average, forKey: .vote_average)
    }
}

extension Movie {
    @nonobjc class func fetchMovieRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }
}
