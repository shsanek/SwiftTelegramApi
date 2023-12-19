import Foundation

extension TelegramAPI {
    /// Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success.
    public func setStickerMaskPosition(_ input: SetStickerMaskPositionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerMaskPosition", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request setStickerMaskPosition
import Foundation
public final class SetStickerMaskPositionInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. File identifier of the sticker
	public let sticker: String
	
	///Optional. A JSON-serialized object with the position where the mask should be placed on faces. Omit the parameter to remove the mask position.
	public let maskPosition: MaskPosition?

	public init(
		sticker: String,
		maskPosition: MaskPosition? = nil
	) {
		self.sticker = sticker
		self.maskPosition = maskPosition
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case maskPosition = "mask_position"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encodeIfPresent(self.maskPosition.self, forKey: .maskPosition)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.sticker = try container.decode(String.self, forKey: .sticker)
		self.maskPosition = try container.decodeIfPresent(MaskPosition.self, forKey: .maskPosition)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}