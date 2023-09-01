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

    internal let attach: [MultiPartFromDataContainer]
    internal let data: () -> Data
    internal let absoluteName: String?
    internal let parameters: [String: String]
    internal let type: String
    internal let contentType: String?
    internal let mimeType: String?

    internal init(_ data: @escaping () -> Data, 
                  type: String? = nil,
                  absoluteName: String? = nil,
                  attach: [MultiPartFromDataContainer] = [],
                  parameters: [String: String] = [:],
                  contentType: String? = nil,
                  mimeType: String? = nil)
    {
        self.type = type ?? "Content-Disposition: form-data"
        self.mimeType = mimeType
        self.parameters = parameters
        self.data = data
        self.absoluteName = absoluteName
        self.contentType = contentType
        self.attach = attach
    }
    
    internal init(_ string: String, 
                  type: String? = nil,
                  absoluteName: String? = nil,
                  attach: [MultiPartFromDataContainer] = [],
                  parameters: [String: String] = [:],
                  contentType: String? = nil)
    {
        self.type = type ?? "Content-Disposition: form-data"
        self.parameters = parameters
        self.absoluteName = absoluteName
        self.data = { string.data(using: .utf8)! }
        self.contentType = contentType
        self.attach = attach
        self.mimeType = nil
    }

}


extension MultiPartFromDataContainer {
    init(object: Encodable) throws {
        let json = JSONEncoder()
        let container = JSONAttachEncoder()
        json.userInfo[JSONAttachEncoder.key] = container
        let data = try json.encode(object)
        self = MultiPartFromDataContainer({ data }, attach: container.attaches)
    }
}
