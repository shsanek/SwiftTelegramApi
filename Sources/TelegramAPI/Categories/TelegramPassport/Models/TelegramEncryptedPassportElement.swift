//
//  TelegramEncryptedPassportElement.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Contains information about documents or other Telegram Passport elements shared with the bot by the user.
public struct TelegramEncryptedPassportElement
{

	///Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.
	public let type: String

	///Optional. Base64-encoded encrypted Telegram Passport element data provided by the user, available for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.
	public let data: String?

	///Optional. User&#39;s verified phone number, available only for “phone_number” type
	public let phoneNumber: String?

	///Optional. User&#39;s verified email address, available only for “email” type
	public let email: String?

	///Optional. Array of encrypted files with documents provided by the user, available for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
	public let files: [TelegramPassportFile]?

	///Optional. Encrypted file with the front side of the document, provided by the user. Available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
	public let frontSide: TelegramPassportFile?

	///Optional. Encrypted file with the reverse side of the document, provided by the user. Available for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
	public let reverseSide: TelegramPassportFile?

	///Optional. Encrypted file with the selfie of the user holding a document, provided by the user; available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
	public let selfie: TelegramPassportFile?

	///Optional. Array of encrypted files with translated versions of documents provided by the user. Available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
	public let translation: [TelegramPassportFile]?

	///Base64-encoded element hash for using in PassportElementErrorUnspecified
	public let hash: String

	public init(type: String,
                data: String? = nil,
                phoneNumber: String? = nil,
                email: String? = nil,
                files: [TelegramPassportFile]? = nil,
                frontSide: TelegramPassportFile? = nil,
                reverseSide: TelegramPassportFile? = nil,
                selfie: TelegramPassportFile? = nil,
                translation: [TelegramPassportFile]? = nil,
                hash: String)
	{
		self.type = type
		self.data = data
		self.phoneNumber = phoneNumber
		self.email = email
		self.files = files
		self.frontSide = frontSide
		self.reverseSide = reverseSide
		self.selfie = selfie
		self.translation = translation
		self.hash = hash
	}

}

extension TelegramEncryptedPassportElement: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case data
		case phoneNumber = "phone_number"
		case email
		case files
		case frontSide = "front_side"
		case reverseSide = "reverse_side"
		case selfie
		case translation
		case hash
	}

}