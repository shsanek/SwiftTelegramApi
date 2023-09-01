//
//  IMultiPartFromDataValueEncodable.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

internal protocol IMultiPartFromDataValueEncodable
{
    
    func multipartFromDataValue() throws -> MultiPartFromDataContainer

}

extension Bool: IMultiPartFromDataValueEncodable
{
    
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        return self ? MultiPartFromDataContainer("true") : MultiPartFromDataContainer("false")
    }
    
}

extension String: IMultiPartFromDataValueEncodable
{

    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        return MultiPartFromDataContainer(self)
    }

}
