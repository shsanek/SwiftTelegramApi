//
//  MultiPartFromDataContainer.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

internal struct MultiPartFromDataContainer
{
    
    internal let data: () -> Data
    internal let parameters: [String: String]
    internal let type: String
    internal let contentType: String?

    internal init(_ data: @escaping () -> Data, 
                  type: String? = nil, 
                  parameters: [String: String] = [:],
                  contentType: String? = nil)
    {
        self.type = type ?? "Content-Disposition: form-data"
        self.parameters = parameters
        self.data = data
        self.contentType = contentType
    }
    
    internal init(_ string: String, 
                  type: String? = nil, 
                  parameters: [String: String] = [:],
                  contentType: String? = nil)
    {
        self.type = type ?? "Content-Disposition: form-data"
        self.parameters = parameters
        self.data = { string.data(using: .utf8)! }
        self.contentType = contentType
    }

}
