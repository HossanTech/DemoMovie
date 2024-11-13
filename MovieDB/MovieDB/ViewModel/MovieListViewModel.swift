//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//
import Foundation

enum ViewState {
  case loading
  case error
  case loaded
  case emptyView
}

protocol MovieListViewModelAction: ObservableObject {
  func getMovieList(urlStr: String) async
}
// MARK: - Movie List ViewModel Implementation.
@MainActor
final class MovieListViewModel {
  
  @Published private(set) var viewState: ViewState = .loaded
  @Published private(set) var movieLists: MovieResult = []
  private let repository: MovieCardsRepository
  
  init(repository: MovieCardsRepository) {
    self.repository = repository
  }
}

extension MovieListViewModel: MovieListViewModelAction {
  
  func getMovieList(urlStr: String) async {
    viewState = .loaded
    guard let url = URL(string: urlStr) else { return }
    do {
      let lists = try await repository.getMovieList(for: url)
      movieLists = lists.results
      viewState =  movieLists.isEmpty ? .emptyView : .loaded
    } catch {
      viewState = .error
    }
  }
}
