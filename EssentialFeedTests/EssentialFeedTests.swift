//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by John Gers on 11/27/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    // Singleton
    // static let shared = HTTPClient()
    // Should have private init
    
    // Static mutable instance
    static var shared = HTTPClient()
    
    
    func get(from url: URL) { }
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        // Constructor injection
        // Property injection
        // Method injection
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
