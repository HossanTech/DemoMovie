//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import SwiftUI

@main
struct MovieDBApp: App {
    var body: some Scene {
        WindowGroup {
          MovieListView(viewModel: MovieListViewModel(repository: MovieRepositoryImplementation(networkManager: NetworkManager())))
        }
    }
}
