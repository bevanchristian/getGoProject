//
//  NetworkService.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation
import Combine

class NetworkService {
    private var requestUtil: RequestUtils
   
    private var subscription = Set<AnyCancellable>()
    var apiError = PassthroughSubject<ApiError,Never>()
    var characterResult = CurrentValueSubject<Character?, Never>(nil)
    init(env: RequestUtils) {
        self.requestUtil = env
    }
    
    func getCharacter() {
        var urlComponent = URLComponents(string: UrlConstant.base("1").urlString)
        guard let _ = try? URLRequest(url: (urlComponent?.url)!) else {return}
        requestUtil.request(urlComponent: urlComponent!, model: Character.self).sink { completion in
            switch completion {
            case .finished:
                print(completion)
            case .failure(let err):
                self.apiError.send(err)
            }
        } receiveValue: { data in
            self.characterResult.send(data)
        }.store(in: &subscription)
    }
    
    
    func loadMoreCharacter(page: Int) {
        var urlComponent = URLComponents(string: UrlConstant.base("\(page)").urlString)
        guard let _ = try? URLRequest(url: (urlComponent?.url)!) else {return}
        requestUtil.request(urlComponent: urlComponent!, model: Character.self).sink { completion in
            switch completion {
            case .finished:
                print(completion)
            case .failure(let err):
              
                self.apiError.send(err)
            }
        } receiveValue: { data in
            self.characterResult.send(data)
        }.store(in: &subscription)
    }
}
