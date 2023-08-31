extension TelegramAPI {
    /// Use this method to send information about a venue. On success, the sent Message is returned.
    public func sendVenue(_ input: SendVenueInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendVenue", object: input, completion: completionHandler)
    }
}

//Input model for request sendVenue
public final class SendVenueInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Latitude of the venue
	public let latitude: TelegramFloat
	
	///Yes. Longitude of the venue
	public let longitude: TelegramFloat
	
	///Yes. Name of the venue
	public let title: String
	
	///Yes. Address of the venue
	public let address: String
	
	///Optional. Foursquare identifier of the venue
	public let foursquareId: String?
	
	///Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
	public let foursquareType: String?
	
	///Optional. Google Places identifier of the venue
	public let googlePlaceId: String?
	
	///Optional. Google Places type of the venue. (See supported types.)
	public let googlePlaceType: String?
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the sent message from forwarding and saving
	public let protectContent: Bool?
	
	///Optional. If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?
	
	///Optional. Pass True if the message should be sent even if the specified replied-to message is not found
	public let allowSendingWithoutReply: Bool?
	
	///Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		title: String,
		address: String,
		foursquareId: String? = nil,
		foursquareType: String? = nil,
		googlePlaceId: String? = nil,
		googlePlaceType: String? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
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