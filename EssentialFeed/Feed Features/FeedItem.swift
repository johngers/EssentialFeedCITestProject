//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by John Gers on 11/26/21.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}

