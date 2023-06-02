//
//  ContentViewViewModel.swift
//  SpaceNews
//
//  Created by Nick Pavlov on 6/2/23.
//

import Foundation

class ContentViewViewModel: ObservableObject {
    @Published var results = [Results]()
    
    init() {
        Task {
            try await fetchData()
        }
    }
    
    @MainActor
    private func fetchData() async throws {
        let urlPath = "https://api.spaceflightnewsapi.net/v4/articles/"
        guard let url = URL(string: urlPath) else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                //print("Response is good \(response.statusCode)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedData = try decoder.decode(News.self, from: data)
            
            results = decodedData.results
        } catch {
            print("Failed to fetch data \(error)")
        }
    }
}
