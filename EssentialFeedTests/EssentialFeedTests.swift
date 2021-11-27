//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by John Gers on 11/27/21.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    // Singleton
    // static let shared = HTTPClient()
    // Should have private init
    
    // Static mutable instance
    // static var shared = HTTPClient()
    // Utilizes subclassing
    
    
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        // Constructor injection
        // Property injection
        // Method injection
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
