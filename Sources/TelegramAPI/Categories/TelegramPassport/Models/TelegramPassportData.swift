//
//  TelegramPassportData.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Contains information about Telegram Passport data shared with the bot by the user.
public struct TelegramPassportData
{

	///Array with information about documents and other Telegram Passport elements that was shared with the bot
	public let data: [TelegramEncryptedPassportElement]

	///Encrypted credentials required to decrypt the data
	public let credentials: TelegramEncryptedCredentials

	public init(data: [TelegramEncryptedPassportElement],
                credentials: TelegramEncryptedCredentials)
	{
		self.data = data
		self.credentials = credentials
	}

}

extension TelegramPassportData: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case data
		case credentials
	}

}