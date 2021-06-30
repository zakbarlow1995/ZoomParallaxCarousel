//
//  Assets.swift
//  ZoomParallaxCarousel
//
//  Created by Zak Barlow on 30/06/2021.
//

import Foundation

struct Asset: Identifiable {
    let name: String
    let description: String
    let id = UUID()
}

struct Assets {
    static let all: [Asset] = [
        Asset(name: "ww1984", description: "Wonder Woman 1984"),
        Asset(name: "infinity-war", description: "Avengers Infinity War"),
        Asset(name: "endgame", description: "Avengers Endgame"),
        Asset(name: "a-new-hope", description: "Star Wars IV: A New Hope"),
        Asset(name: "empire", description: "Star Wars V: The Empire Strikes Back"),
        Asset(name: "rotj", description: "Star Wars VI: Return of the Jedi"),
        Asset(name: "akira", description: "Akira"),
        Asset(name: "mib", description: "Men in Black"),
        Asset(name: "hp", description: "Harry Potter and the Philosopher's Stone"),
    ]
}
