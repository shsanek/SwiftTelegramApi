//
//  TelegramFloat.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public typealias TelegramFloat = Double

extension Double: IMultiPartFromDataValueEncodable
{

    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        return MultiPartFromDataContainer("\(self)")
    }

}
