//
//  FileProvider.swift
//  CaseStudy
//
//  Created by Alper Senyurt on 3/10/20.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation


protocol FileProviderProtocol {
    func extractModel<T: Decodable>(from fileName: String) -> Result<T, Error>
}


extension FileProviderProtocol {
    func extractModel<T: Decodable>(from fileName: String) -> Result<T, Error> {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return .success(jsonData)
            } catch {
                print("error:\(error)")
                return .failure(error)
            }
        }
        return .failure(FileProviderError.loaderError)
    }
}

enum FileProviderError: LocalizedError {
    case loaderError

    var errorDescription: String? {
        switch self {
        case .loaderError:
            return "Url is not loaded from local"
        }
    }
}
