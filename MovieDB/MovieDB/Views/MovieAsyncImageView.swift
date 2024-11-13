//
//  MovieAsyncImageView.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//
import SwiftUI

struct MovieAsyncImageView: View {
  
  let url: URL
  private let imageWidth = 150.0
  private let cellHeight = 150.0
  
  var body: some View {
    CacheAsyncImage(
      url: url) { phase in
        switch phase {
        case .success(let image):
          VStack {
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: imageWidth)
            
              .padding(.trailing, 10)
            Spacer()
          }
        case .failure:
          Image(systemName: "film.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageWidth)
            .padding(.trailing, 10)
          
        case .empty:
          HStack(alignment: .center) {
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: .red))
          }
        @unknown default:
          Image(systemName: "film.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageWidth)
            .padding(.trailing, 10)
        }
      }
  }
}
