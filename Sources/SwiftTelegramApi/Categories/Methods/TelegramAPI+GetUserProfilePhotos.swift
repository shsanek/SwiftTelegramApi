import Foundation

extension TelegramAPI {
    /// Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
    public func getUserProfilePhotos(_ input: GetUserProfilePhotosInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<UserProfilePhotos>) -> Void) {
        self.requester.request("getUserProfilePhotos", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func getUserProfilePhotos(_ input: GetUserProfilePhotosInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> UserProfilePhotos {
        try await self.requester.request("getUserProfilePhotos", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getUserProfilePhotos
import Foundation
public final class GetUserProfilePhotosInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger
	
	///Optional. Sequential number of the first photo to be returned. By default, all photos are returned.
	public let offset: TelegramInteger?
	
	///Optional. Limits the number of photos to be retrieved. Values between 1-100 are accepted. Defaults to 100.
	public let limit: TelegramInteger?

	public init(
		userId: TelegramInteger,
		offset: TelegramInteger? = nil,
		limit: TelegramInteger? = nil
	) {
		self.userId = userId
		self.offset = offset
		self.limit = limit
	}

	private enum CodingKeys: String, CodingKey {
		case userId = "user_id"
		case offset
		case limit
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encodeIfPresent(self.offset.self, forKey: .offset)
		try container.encodeIfPresent(self.limit.self, forKey: .limit)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
		self.offset = try container.decodeIfPresent(TelegramInteger.self, forKey: .offset)
		self.limit = try container.decodeIfPresent(TelegramInteger.self, forKey: .limit)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}