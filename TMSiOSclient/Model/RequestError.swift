//
//  RequestError.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import Foundation

enum RequestError: Error {
    case missingData
    case networkError
}

extension RequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Missing data",
                comment: ""
            )
            
        case .networkError:
            return NSLocalizedString ("Network error", comment: "")
        }
    }
}
