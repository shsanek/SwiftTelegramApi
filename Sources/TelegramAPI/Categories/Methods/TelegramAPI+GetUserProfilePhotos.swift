extension TelegramAPI {
    /// Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
    public func getUserProfilePhotos(_ input: GetUserProfilePhotosInput, completionHandler: @escaping (TelegramResult<UserProfilePhotos>) -> Void) {
        self.requester.request("getUserProfilePhotos", object: input, completion: completionHandler)
    }
}

//Input model for request getUserProfilePhotos
public final class GetUserProfilePhotosInput: Encodable {
	///Yes
	public let userId: TelegramInteger
	
	///Optional
	public let offset: TelegramInteger
	
	///Optional
	public let limit: TelegramInteger

	public init(
		userId: TelegramInteger,
		offset: TelegramInteger,
		limit: TelegramInteger
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
		try container.encode(self.offset.self, forKey: .offset)
		try container.encode(self.limit.self, forKey: .limit)
	}
}