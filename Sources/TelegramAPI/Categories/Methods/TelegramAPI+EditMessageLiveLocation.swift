extension TelegramAPI {
    /// Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageLiveLocation(_ input: EditMessageLiveLocationInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editMessageLiveLocation", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageLiveLocation
public final class EditMessageLiveLocationInput: IMultiPartFromDataEncodable {
	///Optional
	public let chatId: TelegramIdentifierContainer?
	
	///Optional
	public let messageId: TelegramInteger?
	
	///Optional
	public let inlineMessageId: String?
	
	///Yes
	public let latitude: TelegramFloat
	
	///Yes
	public let longitude: TelegramFloat
	
	///Optional
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional
	public let heading: TelegramInteger?
	
	///Optional
	public let proximityAlertRadius: TelegramInteger?
	
	///Optional
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

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("inline_message_id", object: self.inlineMessageId)
		encoder.append("latitude", object: self.latitude)
		encoder.append("longitude", object: self.longitude)
		encoder.append("horizontal_accuracy", object: self.horizontalAccuracy)
		encoder.append("heading", object: self.heading)
		encoder.append("proximity_alert_radius", object: self.proximityAlertRadius)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}