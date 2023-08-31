extension TelegramAPI {
    /// Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.
    public func setPassportDataErrors(_ input: SetPassportDataErrorsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setPassportDataErrors", object: input, completion: completionHandler)
    }
}

//Input model for request setPassportDataErrors
public final class SetPassportDataErrorsInput: Encodable {
	///Yes
	public let userId: TelegramInteger
	
	///Yes
	public let errors: [PassportElementError]

	public init(
		userId: TelegramInteger,
		errors: [PassportElementError]
	) {
		self.userId = userId
		self.errors = errors
	}

	private enum CodingKeys: String, CodingKey {
		case userId = "user_id"
		case errors
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encode(self.errors.self, forKey: .errors)
	}
}