//
//  MovieListView.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import SwiftUI

struct MovieListView: View {
  // MARK: - Using State Object to make sure view model object will not destroyed or recreate.
  @StateObject var viewModel: MovieListViewModel
  @State private var isErrorOccured = true
  
  var body: some View {
    NavigationStack {
      VStack {
        switch viewModel.viewState {
        case .loading:
          ProgressView()
        case .loaded:
          showMovieListView()
        case .error:
          showErrorView()
        case .emptyView:
          EmptyView()
        }
      }
      .navigationTitle(Text(LocalizedStringKey("Movie List")))
    }.task {
      await viewModel.getMovieList(urlStr: Endpoint.movieListURL)
    }
  }
  // MARK: - Using ViewBuilder to create the child view.
  @ViewBuilder
  func showMovieListView() -> some View {
    List(viewModel.movieLists) { movieList in
      NavigationLink {
       // PeopleDetailsView(people: peopleList)
      }label: {
        MovieCellView(movie: movieList)
      }
    }
  }
  
  @ViewBuilder
  func showErrorView() -> some View {
    ProgressView().alert(isPresented: $isErrorOccured) {
      Alert(title: Text("Error Occured"),message: Text("Something went wrong"),
            dismissButton: .default(Text("Ok")))
    }
  }
}

#Preview {
  MovieListView(viewModel: MovieListViewModel(repository: MovieRepositoryImplementation(networkManager: NetworkManager())))
}
