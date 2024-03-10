import Foundation

extension TelegramAPI {
    /// Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success.
    public func setStickerSetThumbnail(_ input: SetStickerSetThumbnailInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerSetThumbnail", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func setStickerSetThumbnail(_ input: SetStickerSetThumbnailInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setStickerSetThumbnail", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setStickerSetThumbnail
import Foundation
public final class SetStickerSetThumbnailInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Sticker set name
	public let name: String
	
	///Yes. User identifier of the sticker set owner
	public let userId: TelegramInteger
	
	///Optional. A .WEBP or .PNG image with the thumbnail, must be up to 128 kilobytes in size and have a width and height of exactly 100px, or a .TGS animation with a thumbnail up to 32 kilobytes in size (see https://core.telegram.org/stickers#animated-sticker-requirements for animated sticker technical requirements), or a WEBM video with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#video-sticker-requirements for video sticker technical requirements. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files ». Animated and video sticker set thumbnails can't be uploaded via HTTP URL. If omitted, then the thumbnail is dropped and the first sticker is used as the thumbnail.
	public let thumbnail: TelegramInputFileContainer?

	public init(
		name: String,
		userId: TelegramInteger,
		thumbnail: TelegramInputFileContainer? = nil
	) {
		self.name = name
		self.userId = userId
		self.thumbnail = thumbnail
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case userId = "user_id"
		case thumbnail
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
		self.thumbnail = try container.decodeIfPresent(TelegramInputFileContainer.self, forKey: .thumbnail)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}