//
//  TelegramGame.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
public struct TelegramGame
{

	///Title of the game
	public let title: String

	///Description of the game
	public let description: String

	///Photo that will be displayed in the game message in chats.
	public let photo: [TelegramPhotoSize]

	///Optional. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
	public let text: String?

	///Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
	public let textEntities: [TelegramMessageEntity]?

	///Optional. Animation that will be displayed in the game message in chats. Upload via BotFather
	public let animation: TelegramAnimation?

	public init(title: String,
                description: String,
                photo: [TelegramPhotoSize],
                text: String? = nil,
                textEntities: [TelegramMessageEntity]? = nil,
                animation: TelegramAnimation? = nil)
	{
		self.title = title
		self.description = description
		self.photo = photo
		self.text = text
		self.textEntities = textEntities
		self.animation = animation
	}

}

extension TelegramGame: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case title
		case description
		case photo
		case text
		case textEntities = "text_entities"
		case animation
	}

}