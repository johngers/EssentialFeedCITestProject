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
    func get(from url: URL)
}

// Doesn't need to know how to locate the instance
// Instead inject the Client as a dependency
// Dependency Injection 🤯
public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load() {
        client.get(from: url)
    }
}
