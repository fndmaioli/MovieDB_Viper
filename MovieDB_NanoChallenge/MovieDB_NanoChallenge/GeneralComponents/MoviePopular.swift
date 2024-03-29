// To parse the JSON, add this file to your project and do:
//
//   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

public struct MoviePopular: Codable {
    public let page, totalResults, totalPages: Int
    public let results: [ResultPopular]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

public struct ResultPopular: Codable, MovieGeneral {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: String
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}


protocol MovieGeneral {
    var title: String { get }
    var releaseDate: String { get }
    var voteAverage: Double { get }
    var posterPath: String { get }
    var overview: String { get }
    var backdropPath: String { get }
}

struct MovieDetail: Codable {
    let backdropPath: String?
    let genres: [Genre]?
    let id: Int?
    let imdbID, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres, id
        case imdbID = "imdb_id"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case title
    }
}

struct Genre: Codable {
    var id: Int?
    var name: String?
}
