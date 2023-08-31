extension TelegramAPI {
    /// Use this method to send information about a venue. On success, the sent Message is returned.
    public func sendVenue(_ input: SendVenueInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendVenue", object: input, completion: completionHandler)
    }
}

//Input model for request sendVenue
public final class SendVenueInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let latitude: TelegramFloat
	
	///Yes
	public let longitude: TelegramFloat
	
	///Yes
	public let title: String
	
	///Yes
	public let address: String
	
	///Optional
	public let foursquareId: String
	
	///Optional
	public let foursquareType: String
	
	///Optional
	public let googlePlaceId: String
	
	///Optional
	public let googlePlaceType: String
	
	///Optional
	public let disableNotification: Bool
	
	///Optional
	public let protectContent: Bool
	
	///Optional
	public let replyToMessageId: TelegramInteger
	
	///Optional
	public let allowSendingWithoutReply: Bool
	
	///Optional
	public let replyMarkup: TelegramMarkupContainer

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		title: String,
		address: String,
		foursquareId: String,
		foursquareType: String,
		googlePlaceId: String,
		googlePlaceType: String,
		disableNotification: Bool,
		protectContent: Bool,
		replyToMessageId: TelegramInteger,
		allowSendingWithoutReply: Bool,
		replyMarkup: TelegramMarkupContainer
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.latitude = latitude
		self.longitude = longitude
		self.title = title
		self.address = address
		self.foursquareId = foursquareId
		self.foursquareType = foursquareType
		self.googlePlaceId = googlePlaceId
		self.googlePlaceType = googlePlaceType
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("latitude", object: self.latitude)
		encoder.append("longitude", object: self.longitude)
		encoder.append("title", object: self.title)
		encoder.append("address", object: self.address)
		encoder.append("foursquare_id", object: self.foursquareId)
		encoder.append("foursquare_type", object: self.foursquareType)
		encoder.append("google_place_id", object: self.googlePlaceId)
		encoder.append("google_place_type", object: self.googlePlaceType)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}