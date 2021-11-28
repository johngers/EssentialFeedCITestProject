//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by John Gers on 11/27/21.
//

import Foundation

// Is just a contract defining which function is needed
// And by creating a protocol, we can create an extension on other types that confirm to the protocol thus making it more flexible.
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}

// Doesn't need to know how to locate the instance
// Instead inject the Client as a dependency
// Dependency Injection 🤯
public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}
