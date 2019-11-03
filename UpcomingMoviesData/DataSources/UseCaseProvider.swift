//
//  UseCaseProvider.swift
//  UpcomingMoviesData
//
//  Created by Alonso on 11/2/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import Foundation
import UpcomingMoviesDomain

final public class UseCaseProvider: UseCaseProviderProtocol {
    
    private let localDataSource: LocalDataSourceProtocol
    private let remoteDataSource: RemoteDataSourceProtocol
    
    public init(localDataSource: LocalDataSourceProtocol,
                remoteDataSource: RemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public func genreUseCase() -> GenreUseCaseProtocol {
        let localDataSource = self.localDataSource.genreDataSource()
        let remoteDataSource = self.remoteDataSource.genreDataSource()
        return GenreRepository(localDataSource: localDataSource,
                               remoteDataSource: remoteDataSource)
    }
    
    public func movieVisitUseCase() -> MovieVisitUseCaseProtocol {
        let localDataSource = self.localDataSource.movieVisitDataSource()
        return MovieVisitRepository(localDataSource: localDataSource)
    }
    
    public func movieSearchUseCase() -> MovieSearchUseCaseProtocol {
        let localDataSource = self.localDataSource.movieSearchDataSource()
        return MovieSearchRepository(localDataSource: localDataSource)
    }
    
    public func userUseCase() -> UserUseCaseProtocol {
        let localDataSource = self.localDataSource.userDataSource()
        return UserRepository(localDataSource: localDataSource)
    }
    
}
