//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by John Gers on 11/27/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() { }

    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        // Constructor injection
        // Property injection
        // Method injection
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
