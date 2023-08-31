extension TelegramAPI {
    /// Use this method to upload a file with a sticker for later use in the createNewStickerSet and addStickerToSet methods (the file can be used multiple times). Returns the uploaded File on success.
    public func uploadStickerFile(_ input: UploadStickerFileInput, completionHandler: @escaping (TelegramResult<File>) -> Void) {
        self.requester.request("uploadStickerFile", object: input, completion: completionHandler)
    }
}

//Input model for request uploadStickerFile
public final class UploadStickerFileInput: IMultiPartFromDataEncodable {
	///Yes. User identifier of sticker file owner
	public let userId: TelegramInteger
	
	///Yes. A file with the sticker in .WEBP, .PNG, .TGS, or .WEBM format. See https://core.telegram.org/stickers for technical requirements. More information on Sending Files »
	public let sticker: TelegramInputFile
	
	///Yes. Format of the sticker, must be one of “static”, “animated”, “video”
	public let stickerFormat: String

	public init(
		userId: TelegramInteger,
		sticker: TelegramInputFile,
		stickerFormat: String
	) {
		self.userId = userId
		self.sticker = sticker
		self.stickerFormat = stickerFormat
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("user_id", object: self.userId)
		encoder.append("sticker", object: self.sticker)
		encoder.append("sticker_format", object: self.stickerFormat)
	}
}