//
//  UrlConstant.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation


enum UrlConstant {
    case firstPage
    case base(String)
    
    var urlString: String {
        switch self {
        case .firstPage:
            return "https://rickandmortyapi.com/api/character/?page=1"
        case .base(let page):
            return "https://rickandmortyapi.com/api/character/?page=\(page)"
        }
    }
}
