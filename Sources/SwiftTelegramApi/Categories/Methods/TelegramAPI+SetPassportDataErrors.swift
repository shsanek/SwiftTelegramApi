import Foundation

extension TelegramAPI {
    /// Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.
    public func setPassportDataErrors(_ input: SetPassportDataErrorsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setPassportDataErrors", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func setPassportDataErrors(_ input: SetPassportDataErrorsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setPassportDataErrors", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setPassportDataErrors
import Foundation
public final class SetPassportDataErrorsInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. User identifier
	public let userId: TelegramInteger
	
	///Yes. A JSON-serialized array describing the errors
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
		self.errors = try container.decode([PassportElementError].self, forKey: .errors)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}