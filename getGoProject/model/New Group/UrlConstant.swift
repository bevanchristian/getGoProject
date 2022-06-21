//
//  UrlConstant.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation


enum UrlConstant {
    case base(String)
    
    var urlString: String {
        switch self {
        case .base(let page):
            return "https://rickandmortyapi.com/api/character/?page=\(page)"
        }
    }
}
