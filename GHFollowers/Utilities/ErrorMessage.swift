//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 07/03/25.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidUsername  = "This username created a invalid request. Please try again."
    case unableToComplete  = "There has some error occurred while making requrest. Please try again"
    case invalidResponse   = "Invalid response from the server. Please try again"
    case invalidData       = "Unexpected data from the server. Please Try again"
    case unableToFavorite = "There was an error favoriting this user. Please try again.|"
}
