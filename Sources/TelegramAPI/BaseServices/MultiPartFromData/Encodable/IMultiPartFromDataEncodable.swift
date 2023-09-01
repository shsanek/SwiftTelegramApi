//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation

internal protocol IMultiPartFromDataEncodable
{
    
    func encode(_ encoder: MultiPartFromDataEncoder) throws

}

extension Array: IMultiPartFromDataValueEncodable where Element: Encodable
{
    
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        try MultiPartFromDataContainer(object: self)
    }

}
