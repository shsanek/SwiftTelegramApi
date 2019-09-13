//
//  TelegramPoll.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains information about a poll.
public struct TelegramPoll
{

	///Unique poll identifier
	public let id: String

	///Poll question, 1-255 characters
	public let question: String

	///List of poll options
	public let options: [TelegramPollOption]

	///True, if the poll is closed
	public let isClosed: Bool

	public init(id: String,
                question: String,
                options: [TelegramPollOption],
                isClosed: Bool)
	{
		self.id = id
		self.question = question
		self.options = options
		self.isClosed = isClosed
	}

}

extension TelegramPoll: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case question
		case options
		case isClosed = "is_closed"
	}

}