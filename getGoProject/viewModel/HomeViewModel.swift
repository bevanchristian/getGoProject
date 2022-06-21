//
//  HomeViewModel.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    private let service = NetworkService(env: RequestUtils(apiRequest: ApiReal()))
    private var subscription = Set<AnyCancellable>()
    private var currentPage = 1
    @Published var apiError: ApiError?
    @Published var characterResult = [charResult]()
    
    
    init() {
        observeError()
        observeCharacter()
    }
    func loadData() {
        service.getCharacter()
    }
    
    func loadMore() {
        let charValue = service.characterResult.value
        if charValue?.info?.next != nil {
            currentPage += 1
            service.loadMoreCharacter(page: currentPage)
        }
    }
    
    private func observeCharacter() {
        service.characterResult
            .dropFirst()
            .sink { char in
                if let result = char?.results {
                    self.characterResult =  self.characterResult + result
                }
        }.store(in: &subscription)
    }
    
    private func observeError() {
        service.apiError
            .sink { err in
                self.apiError = err
        }.store(in: &subscription)
    }
}
