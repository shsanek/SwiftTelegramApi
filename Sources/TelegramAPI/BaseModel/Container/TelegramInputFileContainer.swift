//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public enum TelegramInputFileContainer: Codable
{
    
    case identifier(identifier: String)
    case file(file: TelegramInputFile)
    
    public init(from decoder: Decoder) throws 
    {
        fatalError()
    }
    
    public func encode(to encoder: Encoder) throws 
    {
        var container = encoder.singleValueContainer()
        switch self{
        case .file(let file):
            try container.encode(file)
        case .identifier(let identifier):
            try container.encode(identifier)
        }
    }
    
}

extension TelegramInputFileContainer: IMultiPartFromDataValueEncodable
{
    
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        switch self{
        case .file(let file):
            return try file.multipartFromDataValue()
        case .identifier(let identifier):
            return try identifier.multipartFromDataValue()
        }
    }
    
}
