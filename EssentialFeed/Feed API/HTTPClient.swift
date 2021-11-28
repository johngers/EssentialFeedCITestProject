//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by John Gers on 11/27/21.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}


// Is just a contract defining which function is needed
// And by creating a protocol, we can create an extension on other types that confirm to the protocol thus making it more flexible.
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
