//
//  TelegramEncryptedCredentials.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Contains data required for decrypting and authenticating EncryptedPassportElement. See the Telegram Passport Documentation for a complete description of the data decryption and authentication processes.
public struct TelegramEncryptedCredentials
{

	///Base64-encoded encrypted JSON-serialized data with unique user&#39;s payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication
	public let data: String

	///Base64-encoded data hash for data authentication
	public let hash: String

	///Base64-encoded secret, encrypted with the bot&#39;s public RSA key, required for data decryption
	public let secret: String

	public init(data: String,
                hash: String,
                secret: String)
	{
		self.data = data
		self.hash = hash
		self.secret = secret
	}

}

extension TelegramEncryptedCredentials: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case data
		case hash
		case secret
	}

}