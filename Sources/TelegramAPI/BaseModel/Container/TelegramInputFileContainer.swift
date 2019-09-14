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
        fatalError()
    }
    
}

extension TelegramInputFileContainer: IMultiPartFromDataValueEncodable
{
    
    internal var multipartFromDataValue: MultiPartFromDataContainer {
        switch self{
        case .file(let file):
            return file.multipartFromDataValue
        case .identifier(let identifier):
            return identifier.multipartFromDataValue
        }
    }
    
}
