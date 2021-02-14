//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

internal protocol IMultiPartFromDataEncodable
{
    
    func encode(_ encoder: MultiPartFromDataEncoder)

}

extension Array: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder)
    {
        for i in 0..<self.count
        {
            if let obj = self[i] as? IMultiPartFromDataEncodable
            {
                encoder.append("\(i)", object: obj)
            }
            else if let obj = self[i] as? IMultiPartFromDataValueEncodable
            {
                encoder.append("\(i)", object: obj)
            }
            else
            {
                fatalError()
            }
        }
    }
    
}
