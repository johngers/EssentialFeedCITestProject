//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by John Gers on 11/27/21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
