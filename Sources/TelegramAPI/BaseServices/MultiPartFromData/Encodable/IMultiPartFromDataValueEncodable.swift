//
//  IMultiPartFromDataValueEncodable.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

internal protocol IMultiPartFromDataValueEncodable
{
    
    var multipartFromDataValue: MultiPartFromDataContainer { get }
    
}

extension Bool: IMultiPartFromDataValueEncodable
{
    
    internal var multipartFromDataValue: MultiPartFromDataContainer {
        return self ? MultiPartFromDataContainer("true") : MultiPartFromDataContainer("false")
    }
    
}

extension String: IMultiPartFromDataValueEncodable
{

    internal var multipartFromDataValue: MultiPartFromDataContainer {
        return MultiPartFromDataContainer(self)
    }

}
