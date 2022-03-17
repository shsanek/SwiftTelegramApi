# TelegramAPI

Сгенерированная API для телеграм ботов название сущностей и методов совпадает с офицальной документацией

Пример использования
``` swift
let api = TelegramAPI(token: "botTOKEN")
api.sendMessage(TelegramSendMessageInput(chatId: .integer(identifier: cMainChat), text: "Start bot"), completionHandler: { _ in })
```
