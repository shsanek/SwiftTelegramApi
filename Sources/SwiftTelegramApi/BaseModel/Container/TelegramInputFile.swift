//
//  TelegramInputFile.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public struct TelegramInputFile: Encodable
{

    internal let name: String
    internal let metaInfo: String?
    internal let dataHandler: () -> Data
    
    public init(name: String = "name", metaInfo: String? = nil, dataHandler: @escaping () -> Data)
    {
        self.name = name
        self.metaInfo = metaInfo
        self.dataHandler = dataHandler
    }

    public func encode(to encoder: Encoder) throws {
        let id = UUID().uuidString.replacingOccurrences(of: "-", with: "")
        if let encoder = encoder.userInfo[JSONAttachEncoder.key] as? JSONAttachEncoder {
            let data = MultiPartFromDataContainer(
                { dataHandler() },
                absoluteName: id,
                parameters: ["filename": name]
            )
            encoder.attaches.append(data)
        }
        var container = encoder.singleValueContainer()
        try container.encode("attach://\(id)")
    }
}

class JSONAttachEncoder {
    static let key: CodingUserInfoKey = CodingUserInfoKey(rawValue: "JSONAttachEncoder")!
    var attaches: [MultiPartFromDataContainer] = []
}

extension TelegramInputFile: IMultiPartFromDataValueEncodable
{
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        MultiPartFromDataContainer({ dataHandler() }, parameters: ["filename": name])
    }
}
