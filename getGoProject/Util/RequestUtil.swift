//
//  RequestUtil.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//d

import Foundation
import Combine


protocol ApiProtcol {
    func request(url:URLRequest) -> AnyPublisher<Data, Never>
}


protocol RequestUtilsProtocol {
    func request<T:Codable>(urlComponent: URLComponents,model: T.Type) -> Future<T,ApiError>
}

class RequestUtils: RequestUtilsProtocol {
    var subscription = Set<AnyCancellable>()
    var requestApi: ApiProtcol
    
    init(apiRequest: ApiProtcol = ApiReal()) {
        requestApi = apiRequest
    }

    
    func request<T:Codable>(urlComponent: URLComponents,model: T.Type) -> Future<T,ApiError> {
        return Future() { [self] promise in
            // decodenya
            guard let urlFix = try? URLRequest(url: (urlComponent.url)!) else {return}
            requestApi.request(url: urlFix)
               .decode(type: model.self, decoder: JSONDecoder())
               .tryMap({ data in
                   return data
               })
               .receive(on: DispatchQueue.main)
               .sink { completion in
                   switch completion {
                   case .finished:
                       print(completion)
                   case .failure(let _):
                       promise(.failure(.decodeError))
                   }
               } receiveValue: { hasil in
                   promise(.success(hasil))
               }.store(in: &subscription)
        }
    }
}
