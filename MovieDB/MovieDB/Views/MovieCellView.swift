//
//  MovieCellView.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import SwiftUI

struct MovieCellView: View {
  
  let movie: Result
  
  var body: some View {
    HStack(spacing: 16) {
      if let url = URL(string: Endpoint.movieImageUrl + (movie.posterPath ?? "")) {
        MovieAsyncImageView(url: url)
          .frame(width: 100, height: 150)
          .clipShape(RoundedRectangle(cornerRadius: 16))
          .padding(.leading, -30)
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("ID: \(Int(movie.id))")
          .font(.subheadline)
          .bold()
        
        Text("Name: " + movie.title)
          .font(.subheadline)
          .bold()
          .lineLimit(1)
          .truncationMode(.tail)
        
        Text("Vote: \(String(format: "%.2f", movie.voteAverage))")
          .font(.subheadline)
          .bold()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding()
  }
}
#Preview {
  MovieCellView(movie: Constants.resutl)
}
