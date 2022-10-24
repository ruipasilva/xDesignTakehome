//
//  Utilities.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import Foundation


enum NetworkingError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from server. Please try again"
    case invalidData = "Something went wrong. Please try again"
}
