//
//  ContentView.swift
//  SpaceNews
//
//  Created by Nick Pavlov on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ContentViewViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(vm.results) { news in
                    NewsCell(news: news)
                }
            }
            .navigationTitle("Space News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
