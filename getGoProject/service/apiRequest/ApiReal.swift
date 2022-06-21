//
//  ApiReal.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation
import Combine


class ApiReal: ApiProtcol {
    func request(url: URLRequest) -> AnyPublisher<Data, Never> {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw ApiError.apiError
                }
                return output.data
            }.replaceError(with: Data()).eraseToAnyPublisher()
    }
}
