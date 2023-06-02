//
//  NewsCell.swift
//  SpaceNews
//
//  Created by Nick Pavlov on 6/2/23.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    @Environment(\.openURL) var openURL
    var news: Results
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(news.newsSite)
                .foregroundColor(.blue)
                .font(.title3.italic())
            Button {
                openURL(URL(string: news.url)!)
            } label: {
                KFImage(URL(string: news.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }
            Text(news.title)
                .bold()
            Text(news.summary)
            HStack {
                Spacer()
                Text("\(news.date.formatted(date: .abbreviated, time: .omitted))")
                    .foregroundColor(.secondary)
            }
        
            Divider()
        }
        .padding()
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(news: .moc)
    }
}
