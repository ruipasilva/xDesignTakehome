// Copyright © 2022 xDesign. All rights reserved.

import Foundation

struct Character: Codable {
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let aliases: [String]
    let tvSeries: [String]
    let playedBy: [String]
}
