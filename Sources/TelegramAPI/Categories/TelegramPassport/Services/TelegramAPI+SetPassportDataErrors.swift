//
//  TelegramAPI+SetPassportDataErrors.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.Use this if the data submitted by the user doesn&#39;t satisfy the standards your service requires for any reason. For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc. Supply some details in the error message to make sure the user knows how to correct the issues.
	public func setPassportDataErrors(_ input: TelegramSetPassportDataErrorsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setPassportDataErrors", object: input, completion: completionHandler)
	}

}


public struct TelegramSetPassportDataErrorsInput
{

	///User identifier
	public let userId: TelegramInteger

	///A JSON-serialized array describing the errors
	public let errors: [TelegramPassportElementError]

	public init(userId: TelegramInteger,
                errors: [TelegramPassportElementError])
	{
		self.userId = userId
		self.errors = errors
	}

}

extension TelegramSetPassportDataErrorsInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case errors
	}

}

