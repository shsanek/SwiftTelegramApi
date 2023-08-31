public final class Sticker: Codable, IMultiPartFromDataEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Type of the sticker, currently one of “regular”, “mask”, “custom_emoji”. The type of the sticker is independent from its format, which is determined by the fields is_animated and is_video.
	public let type: String
	
	///Sticker width
	public let width: TelegramInteger
	
	///Sticker height
	public let height: TelegramInteger
	
	///True, if the sticker is animated
	public let isAnimated: Bool
	
	///True, if the sticker is a video sticker
	public let isVideo: Bool
	
	///Optional. Sticker thumbnail in the .WEBP or .JPG format
	public let thumbnail: PhotoSize?
	
	///Optional. Emoji associated with the sticker
	public let emoji: String?
	
	///Optional. Name of the sticker set to which the sticker belongs
	public let setName: String?
	
	///Optional. For premium regular stickers, premium animation for the sticker
	public let premiumAnimation: File?
	
	///Optional. For mask stickers, the position where the mask should be placed
	public let maskPosition: MaskPosition?
	
	///Optional. For custom emoji stickers, unique identifier of the custom emoji
	public let customEmojiId: String?
	
	///Optional. True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
	public let needsRepainting: Bool?
	
	///Optional. File size in bytes
	public let fileSize: TelegramInteger?

	public init(
		fileId: String,
		fileUniqueId: String,
		type: String,
		width: TelegramInteger,
		height: TelegramInteger,
		isAnimated: Bool,
		isVideo: Bool,
		thumbnail: PhotoSize? = nil,
		emoji: String? = nil,
		setName: String? = nil,
		premiumAnimation: File? = nil,
		maskPosition: MaskPosition? = nil,
		customEmojiId: String? = nil,
		needsRepainting: Bool? = nil,
		fileSize: TelegramInteger? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.type = type
		self.width = width
		self.height = height
		self.isAnimated = isAnimated
		self.isVideo = isVideo
		self.thumbnail = thumbnail
		self.emoji = emoji
		self.setName = setName
		self.premiumAnimation = premiumAnimation
		self.maskPosition = maskPosition
		self.customEmojiId = customEmojiId
		self.needsRepainting = needsRepainting
		self.fileSize = fileSize
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case type
		case width
		case height
		case isAnimated = "is_animated"
		case isVideo = "is_video"
		case thumbnail
		case emoji
		case setName = "set_name"
		case premiumAnimation = "premium_animation"
		case maskPosition = "mask_position"
		case customEmojiId = "custom_emoji_id"
		case needsRepainting = "needs_repainting"
		case fileSize = "file_size"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.width.self, forKey: .width)
		try container.encode(self.height.self, forKey: .height)
		try container.encode(self.isAnimated.self, forKey: .isAnimated)
		try container.encode(self.isVideo.self, forKey: .isVideo)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
		try container.encodeIfPresent(self.emoji.self, forKey: .emoji)
		try container.encodeIfPresent(self.setName.self, forKey: .setName)
		try container.encodeIfPresent(self.premiumAnimation.self, forKey: .premiumAnimation)
		try container.encodeIfPresent(self.maskPosition.self, forKey: .maskPosition)
		try container.encodeIfPresent(self.customEmojiId.self, forKey: .customEmojiId)
		try container.encodeIfPresent(self.needsRepainting.self, forKey: .needsRepainting)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.type = try container.decode(String.self, forKey: .type)
		self.width = try container.decode(TelegramInteger.self, forKey: .width)
		self.height = try container.decode(TelegramInteger.self, forKey: .height)
		self.isAnimated = try container.decode(Bool.self, forKey: .isAnimated)
		self.isVideo = try container.decode(Bool.self, forKey: .isVideo)
		self.thumbnail = try container.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
		self.emoji = try container.decodeIfPresent(String.self, forKey: .emoji)
		self.setName = try container.decodeIfPresent(String.self, forKey: .setName)
		self.premiumAnimation = try container.decodeIfPresent(File.self, forKey: .premiumAnimation)
		self.maskPosition = try container.decodeIfPresent(MaskPosition.self, forKey: .maskPosition)
		self.customEmojiId = try container.decodeIfPresent(String.self, forKey: .customEmojiId)
		self.needsRepainting = try container.decodeIfPresent(Bool.self, forKey: .needsRepainting)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("file_id", object: self.fileId)
		encoder.append("file_unique_id", object: self.fileUniqueId)
		encoder.append("type", object: self.type)
		encoder.append("width", object: self.width)
		encoder.append("height", object: self.height)
		encoder.append("is_animated", object: self.isAnimated)
		encoder.append("is_video", object: self.isVideo)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("emoji", object: self.emoji)
		encoder.append("set_name", object: self.setName)
		encoder.append("premium_animation", object: self.premiumAnimation)
		encoder.append("mask_position", object: self.maskPosition)
		encoder.append("custom_emoji_id", object: self.customEmojiId)
		encoder.append("needs_repainting", object: self.needsRepainting)
		encoder.append("file_size", object: self.fileSize)
	}
}