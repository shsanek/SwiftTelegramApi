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

public struct TelegramInputFile
{
    
    internal let name: String
    internal let metaInfo: String?
    internal let dataHandler: () -> Data
    
    public init(name: String, metaInfo: String? = nil, dataHandler: @escaping () -> Data)
    {
        self.name = name
        self.metaInfo = metaInfo
        self.dataHandler = dataHandler
    }
    
}

extension TelegramInputFile: IMultiPartFromDataValueEncodable
{
    
    internal var multipartFromDataValue: MultiPartFromDataContainer {
        return MultiPartFromDataContainer(self.dataHandler)
    }
    
}
