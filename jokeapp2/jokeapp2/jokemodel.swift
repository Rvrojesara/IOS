//
//  jokemodel.swift
//  jokeapp2
//
//  Created by admin on 12/09/24.
//

import Foundation

struct JokeModel: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
