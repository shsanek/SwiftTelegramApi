extension TelegramAPI {
    /// Use this method to upload a file with a sticker for later use in the createNewStickerSet and addStickerToSet methods (the file can be used multiple times). Returns the uploaded File on success.
    public func uploadStickerFile(_ input: UploadStickerFileInput, completionHandler: @escaping (TelegramResult<File>) -> Void) {
        self.requester.request("uploadStickerFile", object: input, completion: completionHandler)
    }
}

//Input model for request uploadStickerFile
public final class UploadStickerFileInput: IMultiPartFromDataEncodable {
	///Yes
	public let userId: TelegramInteger
	
	///Yes
	public let sticker: TelegramInputFile
	
	///Yes
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