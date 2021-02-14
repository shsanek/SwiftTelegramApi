//
//  TelegramInlineKeyboardMarkup.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents an inline keyboard that appears right next to the message it belongs to.
public struct TelegramInlineKeyboardMarkup
{

	///Array of button rows, each represented by an Array of InlineKeyboardButton objects
	public let inlineKeyboard: [[TelegramInlineKeyboardButton]]

	public init(inlineKeyboard: [[TelegramInlineKeyboardButton]])
	{
		self.inlineKeyboard = inlineKeyboard
	}

}

extension TelegramInlineKeyboardMarkup: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case inlineKeyboard = "inline_keyboard"
	}

}

extension TelegramInlineKeyboardMarkup: IMultiPartFromDataEncodable
{
	func encode(_ encoder: MultiPartFromDataEncoder)
	{
		encoder.append("inline_keyboard", object: self.inlineKeyboard)
	}
}
