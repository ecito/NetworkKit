//
//  TargetType.swift
//  
//
//  Created by Andre Navarro on 10/31/19.
//

import Foundation

public protocol TargetType {
    var baseURL: URL { get }
    var headerValues: HTTPHeaders? { get }

    var path: String { get }
    var method: HTTPMethod { get }
    var bodyType: HTTPBodyType { get }
    var body: Encodable? { get }
    var queryParameters: QueryParameters? { get }
    var additionalHeaderValues: HTTPHeaders? { get }
    var cachePolicy: URLRequest.CachePolicy { get }

    var diskPath: String? { get } // for mocks using DiskRequest
    var diskDelay: TimeInterval { get }
}

// defaults
public extension TargetType {
    var bodyType: HTTPBodyType { .none }
    var body: Encodable? { nil }
    var queryParameters: QueryParameters? { nil }
    var headerValues: HTTPHeaders? { nil }
    var additionalHeaderValues: HTTPHeaders? { nil }
    var cachePolicy: URLRequest.CachePolicy { .useProtocolCachePolicy }
    var diskPath: String? { nil }
    var diskDelay: TimeInterval { 0 }
}

extension TargetType {
    func asURLRequest() -> URLRequest? {
        return URLRequest(baseURL: baseURL, path: path, httpMethod: method, headerValues: headerValues,
                          additionalHeaderValues: additionalHeaderValues, queryParameters: queryParameters,
                          bodyType: bodyType, body: body, cachePolicy: cachePolicy)
    }
}
