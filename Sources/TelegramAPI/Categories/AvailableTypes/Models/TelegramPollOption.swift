//
//  TelegramPollOption.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains information about one answer option in a poll.
public struct TelegramPollOption
{

	///Option text, 1-100 characters
	public let text: String

	///Number of users that voted for this option
	public let voterCount: TelegramInteger

	public init(text: String,
                voterCount: TelegramInteger)
	{
		self.text = text
		self.voterCount = voterCount
	}

}

extension TelegramPollOption: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case text
		case voterCount = "voter_count"
	}

}
