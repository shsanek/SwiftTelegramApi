extension TelegramAPI {
    /// Use this method to send point on the map. On success, the sent Message is returned.
    public func sendLocation(_ input: SendLocationInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendLocation", object: input, completion: completionHandler)
    }
}

//Input model for request sendLocation
public final class SendLocationInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let latitude: TelegramFloat
	
	///Yes
	public let longitude: TelegramFloat
	
	///Optional
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional
	public let livePeriod: TelegramInteger?
	
	///Optional
	public let heading: TelegramInteger?
	
	///Optional
	public let proximityAlertRadius: TelegramInteger?
	
	///Optional
	public let disableNotification: Bool?
	
	///Optional
	public let protectContent: Bool?
	
	///Optional
	public let replyToMessageId: TelegramInteger?
	
	///Optional
	public let allowSendingWithoutReply: Bool?
	
	///Optional
	public let replyMarkup: TelegramMarkupContainer?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		horizontalAccuracy: TelegramFloat? = nil,
		livePeriod: TelegramInteger? = nil,
		heading: TelegramInteger? = nil,
		proximityAlertRadius: TelegramInteger? = nil,
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
		self.horizontalAccuracy = horizontalAccuracy
		self.livePeriod = livePeriod
		self.heading = heading
		self.proximityAlertRadius = proximityAlertRadius
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
		encoder.append("horizontal_accuracy", object: self.horizontalAccuracy)
		encoder.append("live_period", object: self.livePeriod)
		encoder.append("heading", object: self.heading)
		encoder.append("proximity_alert_radius", object: self.proximityAlertRadius)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}