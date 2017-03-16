//
//  URLRequest+HTTPBody.swift
//  Pods
//
//  Created by Filip Bec on 16/03/2017.
//
//

import UIKit

internal extension URLRequest {

    internal var data: Data? {
        if let body = httpBody {
            return body
        } else if let stream = httpBodyStream {
            var body = NSMutableData()
            var buffer = [UInt8](repeating: 0, count: 4096)
            stream.open()
            while stream.hasBytesAvailable {
                let length = stream.read(&buffer, maxLength: 4096)
                if length == 0 {
                    break
                } else {
                    body.append(&buffer, length: length)
                }
            }
            return body as Data
        }
        return nil
    }

}