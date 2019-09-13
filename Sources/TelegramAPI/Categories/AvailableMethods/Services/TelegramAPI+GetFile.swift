//
//  TelegramAPI+GetFile.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to get basic info about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot&lt;token&gt;/&lt;file_path&gt;, where &lt;file_path&gt; is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
	public func getFile(_ input: TelegramGetFileInput, completionHandler: @escaping (TelegramResult<TelegramFile>) -> Void)
	{
		self.requester.request("getFile", object: input, completion: completionHandler)
	}

}


public struct TelegramGetFileInput
{

	///File identifier to get info about
	public let fileId: String

	public init(fileId: String)
	{
		self.fileId = fileId
	}

}

extension TelegramGetFileInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
	}

}
