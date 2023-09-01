//
//  TelegramMarkupContainer.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramMarkupContainer: Codable
{
	public let inlineKeyboard: InlineKeyboardMarkup?

	public init(inlineKeyboard: InlineKeyboardMarkup? = nil)
	{
		self.inlineKeyboard = inlineKeyboard
	}
}


extension TelegramMarkupContainer: IMultiPartFromDataValueEncodable
{

	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.inlineKeyboard = try? container.decode(InlineKeyboardMarkup.self)
	}

	public func encode(to encoder: Encoder) throws {
		try self.inlineKeyboard?.encode(to: encoder)
	}


    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        try MultiPartFromDataContainer(object: self)
    }

}
