//
//  ErrorConstant.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation


enum ApiError:Error {
    case decodeError
    case apiError
    case uknown
    
    var description: String {
        switch self {
        case .decodeError:
            return "Decode Error"
        case .apiError:
            return "Server Error"
        case .uknown:
            return "Intenet Error"
        }
    }
}
