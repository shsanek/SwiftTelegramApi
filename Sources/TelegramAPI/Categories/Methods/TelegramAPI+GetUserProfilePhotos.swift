extension TelegramAPI {
    /// Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
    public func getUserProfilePhotos(_ input: GetUserProfilePhotosInput, completionHandler: @escaping (TelegramResult<UserProfilePhotos>) -> Void) {
        self.requester.request("getUserProfilePhotos", object: input, completion: completionHandler)
    }
}

//Input model for request getUserProfilePhotos
public final class GetUserProfilePhotosInput: Encodable {
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
}