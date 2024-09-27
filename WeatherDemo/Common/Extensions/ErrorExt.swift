//
//  ErrorExt.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 17/09/23.
//

import Foundation

extension Error {
    fileprivate var ConnectionIssueCodes: [Int] {
        [
            NSURLErrorNotConnectedToInternet,
            NSURLErrorNetworkConnectionLost,
            NSURLErrorSecureConnectionFailed
        ]
    }

    var isConnectionError: Bool {
        ConnectionIssueCodes.contains(_code)
    }
}
