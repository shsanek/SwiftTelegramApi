import Foundation
public final class Update: Codable, IMultiPartFromDataValueEncodable {
	///The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you're using webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
	public let updateId: TelegramInteger
	
	///Optional. New incoming message of any kind - text, photo, sticker, etc.
	public let message: Message?
	
	///Optional. New version of a message that is known to the bot and was edited
	public let editedMessage: Message?
	
	///Optional. New incoming channel post of any kind - text, photo, sticker, etc.
	public let channelPost: Message?
	
	///Optional. New version of a channel post that is known to the bot and was edited
	public let editedChannelPost: Message?
	
	///Optional. New incoming inline query
	public let inlineQuery: InlineQuery?
	
	///Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
	public let chosenInlineResult: ChosenInlineResult?
	
	///Optional. New incoming callback query
	public let callbackQuery: CallbackQuery?
	
	///Optional. New incoming shipping query. Only for invoices with flexible price
	public let shippingQuery: ShippingQuery?
	
	///Optional. New incoming pre-checkout query. Contains full information about checkout
	public let preCheckoutQuery: PreCheckoutQuery?
	
	///Optional. New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot
	public let poll: Poll?
	
	///Optional. A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
	public let pollAnswer: PollAnswer?
	
	///Optional. The bot's chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user.
	public let myChatMember: ChatMemberUpdated?
	
	///Optional. A chat member's status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify “chat_member” in the list of allowed_updates to receive these updates.
	public let chatMember: ChatMemberUpdated?
	
	///Optional. A request to join the chat has been sent. The bot must have the can_invite_users administrator right in the chat to receive these updates.
	public let chatJoinRequest: ChatJoinRequest?

	public init(
		updateId: TelegramInteger,
		message: Message? = nil,
		editedMessage: Message? = nil,
		channelPost: Message? = nil,
		editedChannelPost: Message? = nil,
		inlineQuery: InlineQuery? = nil,
		chosenInlineResult: ChosenInlineResult? = nil,
		callbackQuery: CallbackQuery? = nil,
		shippingQuery: ShippingQuery? = nil,
		preCheckoutQuery: PreCheckoutQuery? = nil,
		poll: Poll? = nil,
		pollAnswer: PollAnswer? = nil,
		myChatMember: ChatMemberUpdated? = nil,
		chatMember: ChatMemberUpdated? = nil,
		chatJoinRequest: ChatJoinRequest? = nil
	) {
		self.updateId = updateId
		self.message = message
		self.editedMessage = editedMessage
		self.channelPost = channelPost
		self.editedChannelPost = editedChannelPost
		self.inlineQuery = inlineQuery
		self.chosenInlineResult = chosenInlineResult
		self.callbackQuery = callbackQuery
		self.shippingQuery = shippingQuery
		self.preCheckoutQuery = preCheckoutQuery
		self.poll = poll
		self.pollAnswer = pollAnswer
		self.myChatMember = myChatMember
		self.chatMember = chatMember
		self.chatJoinRequest = chatJoinRequest
	}

	private enum CodingKeys: String, CodingKey {
		case updateId = "update_id"
		case message
		case editedMessage = "edited_message"
		case channelPost = "channel_post"
		case editedChannelPost = "edited_channel_post"
		case inlineQuery = "inline_query"
		case chosenInlineResult = "chosen_inline_result"
		case callbackQuery = "callback_query"
		case shippingQuery = "shipping_query"
		case preCheckoutQuery = "pre_checkout_query"
		case poll
		case pollAnswer = "poll_answer"
		case myChatMember = "my_chat_member"
		case chatMember = "chat_member"
		case chatJoinRequest = "chat_join_request"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.updateId.self, forKey: .updateId)
		try container.encodeIfPresent(self.message.self, forKey: .message)
		try container.encodeIfPresent(self.editedMessage.self, forKey: .editedMessage)
		try container.encodeIfPresent(self.channelPost.self, forKey: .channelPost)
		try container.encodeIfPresent(self.editedChannelPost.self, forKey: .editedChannelPost)
		try container.encodeIfPresent(self.inlineQuery.self, forKey: .inlineQuery)
		try container.encodeIfPresent(self.chosenInlineResult.self, forKey: .chosenInlineResult)
		try container.encodeIfPresent(self.callbackQuery.self, forKey: .callbackQuery)
		try container.encodeIfPresent(self.shippingQuery.self, forKey: .shippingQuery)
		try container.encodeIfPresent(self.preCheckoutQuery.self, forKey: .preCheckoutQuery)
		try container.encodeIfPresent(self.poll.self, forKey: .poll)
		try container.encodeIfPresent(self.pollAnswer.self, forKey: .pollAnswer)
		try container.encodeIfPresent(self.myChatMember.self, forKey: .myChatMember)
		try container.encodeIfPresent(self.chatMember.self, forKey: .chatMember)
		try container.encodeIfPresent(self.chatJoinRequest.self, forKey: .chatJoinRequest)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.updateId = try container.decode(TelegramInteger.self, forKey: .updateId)
		self.message = try container.decodeIfPresent(Message.self, forKey: .message)
		self.editedMessage = try container.decodeIfPresent(Message.self, forKey: .editedMessage)
		self.channelPost = try container.decodeIfPresent(Message.self, forKey: .channelPost)
		self.editedChannelPost = try container.decodeIfPresent(Message.self, forKey: .editedChannelPost)
		self.inlineQuery = try container.decodeIfPresent(InlineQuery.self, forKey: .inlineQuery)
		self.chosenInlineResult = try container.decodeIfPresent(ChosenInlineResult.self, forKey: .chosenInlineResult)
		self.callbackQuery = try container.decodeIfPresent(CallbackQuery.self, forKey: .callbackQuery)
		self.shippingQuery = try container.decodeIfPresent(ShippingQuery.self, forKey: .shippingQuery)
		self.preCheckoutQuery = try container.decodeIfPresent(PreCheckoutQuery.self, forKey: .preCheckoutQuery)
		self.poll = try container.decodeIfPresent(Poll.self, forKey: .poll)
		self.pollAnswer = try container.decodeIfPresent(PollAnswer.self, forKey: .pollAnswer)
		self.myChatMember = try container.decodeIfPresent(ChatMemberUpdated.self, forKey: .myChatMember)
		self.chatMember = try container.decodeIfPresent(ChatMemberUpdated.self, forKey: .chatMember)
		self.chatJoinRequest = try container.decodeIfPresent(ChatJoinRequest.self, forKey: .chatJoinRequest)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}