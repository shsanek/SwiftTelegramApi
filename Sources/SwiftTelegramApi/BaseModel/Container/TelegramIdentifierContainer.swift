//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public enum TelegramIdentifierContainer
{

    case integer(_ identifier: TelegramInteger)
    case string(_ identifier: String)

}

extension TelegramIdentifierContainer: Codable
{
    
    public enum TelegramIdentifierContainerError: Error
    {
        case incorectType
    }
    
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.singleValueContainer()
        if let integer = try? container.decode(TelegramInteger.self)
        {
            self = .integer(integer)
            return
        }
        if let string = try? container.decode(String.self)
        {
            self = .string(string)
            return
        }
        throw TelegramIdentifierContainerError.incorectType
    }
    
    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        switch self 
        {
        case .integer(let identifier):
            try container.encode(identifier)
        case .string(let identifier):
            try container.encode(identifier)
        }
    }
}

extension TelegramIdentifierContainer: IMultiPartFromDataValueEncodable
{
    
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        switch self {
        case .integer(let identifier):
            return MultiPartFromDataContainer("\(identifier)")
        case .string(let identifier):
            return MultiPartFromDataContainer(identifier)
        }
    }
    
}
