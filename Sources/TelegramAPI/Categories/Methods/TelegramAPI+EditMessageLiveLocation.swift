extension TelegramAPI {
    /// Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageLiveLocation(_ input: EditMessageLiveLocationInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editMessageLiveLocation", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageLiveLocation
public final class EditMessageLiveLocationInput: IMultiPartFromDataEncodable {
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?
	
	///Yes. Latitude of new location
	public let latitude: TelegramFloat
	
	///Yes. Longitude of new location
	public let longitude: TelegramFloat
	
	///Optional. The radius of uncertainty for the location, measured in meters; 0-1500
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional. Direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
	public let heading: TelegramInteger?
	
	///Optional. The maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
	public let proximityAlertRadius: TelegramInteger?
	
	///Optional. A JSON-serialized object for a new inline keyboard.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil,
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		horizontalAccuracy: TelegramFloat? = nil,
		heading: TelegramInteger? = nil,
		proximityAlertRadius: TelegramInteger? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.latitude = latitude
		self.longitude = longitude
		self.horizontalAccuracy = horizontalAccuracy
		self.heading = heading
		self.proximityAlertRadius = proximityAlertRadius
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_id", object: self.messageId)
		try encoder.append("inline_message_id", object: self.inlineMessageId)
		try encoder.append("latitude", object: self.latitude)
		try encoder.append("longitude", object: self.longitude)
		try encoder.append("horizontal_accuracy", object: self.horizontalAccuracy)
		try encoder.append("heading", object: self.heading)
		try encoder.append("proximity_alert_radius", object: self.proximityAlertRadius)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}