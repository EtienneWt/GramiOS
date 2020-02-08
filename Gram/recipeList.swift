//
//  recipeList.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 06/12/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import Foundation

struct recipeList: Codable{
    var List : [recipe]
    
    enum CodingKeys :String,CodingKey {
        case List
    }
}

// MARK: recipe convenience initializers and mutators

extension recipeList {
    init(data: Data) throws {
        self = try JSONDecoder().decode(recipeList.self, from: data)
    }
    init(){
        self.List = []
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        List: [recipe]? = nil
    ) -> recipeList {
        return recipeList(
            List: List ?? self.List
        )
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func recipeListTask(with url: URL, completionHandler: @escaping (recipeList?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
