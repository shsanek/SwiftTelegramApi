//
//  TelegramMarkupContainer.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramMarkupContainer: Codable
{
	public let inlineKeyboard: TelegramInlineKeyboardMarkup?

	public init(inlineKeyboard: TelegramInlineKeyboardMarkup? = nil)
	{
		self.inlineKeyboard = inlineKeyboard
	}
}


extension TelegramMarkupContainer: IMultiPartFromDataEncodable
{

	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.inlineKeyboard = try? container.decode(TelegramInlineKeyboardMarkup.self)
	}

	public func encode(to encoder: Encoder) throws {
		try self.inlineKeyboard?.encode(to: encoder)
	}

	internal func encode(_ encoder: MultiPartFromDataEncoder)
    {
		inlineKeyboard?.encode(encoder)
    }

}
