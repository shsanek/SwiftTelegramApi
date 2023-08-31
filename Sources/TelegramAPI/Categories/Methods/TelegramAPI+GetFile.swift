extension TelegramAPI {
    /// Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
    public func getFile(_ input: GetFileInput, completionHandler: @escaping (TelegramResult<File>) -> Void) {
        self.requester.request("getFile", object: input, completion: completionHandler)
    }
}

//Input model for request getFile
public final class GetFileInput: Encodable {
	///Yes. File identifier to get information about
	public let fileId: String

	public init(
		fileId: String
	) {
		self.fileId = fileId
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
	}
}