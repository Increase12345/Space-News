//
//  News.swift
//  SpaceNews
//
//  Created by Nick Pavlov on 6/2/23.
//

import Foundation

struct News: Codable {
    let results: [Results]
}

struct Results: Codable, Identifiable {
    let id: Int
    let title: String
    let url: String
    let imageUrl: String
    let newsSite: String
    let summary: String
    let publishedAt: String
    var date: Date {
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: publishedAt)
        return date ?? Date.now
    }
    
    static let moc = Results(id: 0, title: "", url: "", imageUrl: "", newsSite: "", summary: "", publishedAt: "")
}
