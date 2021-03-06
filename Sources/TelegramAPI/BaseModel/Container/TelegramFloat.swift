//
//  TelegramFloat.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public typealias TelegramFloat = Double

extension Double: IMultiPartFromDataValueEncodable
{

    internal var multipartFromDataValue: MultiPartFromDataContainer {
        return MultiPartFromDataContainer("\(self)")
    }

}
