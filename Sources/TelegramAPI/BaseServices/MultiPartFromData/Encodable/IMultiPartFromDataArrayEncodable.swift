//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

internal protocol IMultiPartFromDataArrayEncodable
{
    
    associatedtype Element
    
}

extension Array: IMultiPartFromDataArrayEncodable
{
    
}
