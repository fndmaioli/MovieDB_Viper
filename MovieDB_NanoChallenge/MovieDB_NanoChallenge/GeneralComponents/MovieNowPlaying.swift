// To parse the JSON, add this file to your project and do:
//
//   let movieTopRated = try? newJSONDecoder().decode(MovieTopRated.self, from: jsonData)

import Foundation

public struct MovieNowPlaying: Codable {
    let page, totalResults, totalPages: Int
    let results: [ResultNowPlaying]
    let dates: [DateMovie]
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
        case dates
    }
}

public struct DateMovie: Codable {
    let maximum: String
    let minimum: String
}

public struct ResultNowPlaying: Codable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath, originalLanguage, originalTitle: String
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
