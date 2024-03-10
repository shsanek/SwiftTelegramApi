import Foundation

extension TelegramAPI {
    /// Use this method to upload a file with a sticker for later use in the createNewStickerSet and addStickerToSet methods (the file can be used multiple times). Returns the uploaded File on success.
    public func uploadStickerFile(_ input: UploadStickerFileInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<File>) -> Void) {
        self.requester.request("uploadStickerFile", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func uploadStickerFile(_ input: UploadStickerFileInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> File {
        try await self.requester.request("uploadStickerFile", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("user_id", object: self.userId)
		try encoder.append("sticker", object: self.sticker)
		try encoder.append("sticker_format", object: self.stickerFormat)
	}
}