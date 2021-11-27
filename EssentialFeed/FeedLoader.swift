//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by John Gers on 11/26/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
