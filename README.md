# SwiftTelegramApi

Generated API for Telegram bots name of entities and methods coincides with the official documentation

### SPM

Use spm to add the dependency. Example file `Package.swift`:

``` swift
import PackageDescription

let package = Package(
    name: "MyBot",
    products: [
        .executable(
            name: "MyBot",
            targets: ["MyBot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/shsanek/SwiftTelegramApi", branch: "master")
    ],
    targets: [
        .executableTarget(
            name: "MyBot",
            dependencies: ["SwiftTelegramApi"]
        )
    ]
)
```

### Import and create api

``` swift
import SwiftTelegramApi

let api = TelegramAPI(token: "BOT_TOKEN")
```

### Use method

old style:
``` swift
api.sendMessage(.init(chatId: .integer(MainChat), text: "Start bot"), completionHandler: { _ in })
```

async/await style:
``` swift
try await api.sendMessage(.init(chatId: .integer(MainChat), text: "Start bot"))
```

You can find more methods in the [official documentation of Telegram](https://core.telegram.org/bots/api) their names and models are completely the same.


### Update

This api only supports updates by calling the `update` method. To support WebHook, use in conjunction with Vapor. To support WebHook, use in conjunction with [Vapor](https://github.com/vapor/vapor)

Use method:
``` swift
func update() {
    let updates = try await api.getUpdates(.init(offset: updateOffset.flatMap({ $0 + 1 })))
    for update in updates {
    if let message = update.message {
        try await api.sendMessage(.init(chatId: .integer(message.chat.id), text: message.text ?? ""))
    }
}
```

Use vapor:
``` swift
import Vapor 

func setUpdateHandler(
    serverApp: Vapor.Application,
    telegramApi: TelegramAPI,
    selfSignedCertificate: Data?,
    _ updateHandler: @escaping ([SwiftTelegramApi]) async throws -> Void
) async throws {
    serverApp.post("telegramUpdate") { request in
        guard let bf = request.body.data else {
            throw Error()
        }
        try await updateHandler(bf.json(type: [SwiftTelegramApi].self))
        return "{\"status\": \"ok\"}"
    }
    if let selfSignedCertificate {
        // See our self-signed guide for details. https://core.telegram.org/bots/self-signed
        try await telegramApi.setWebhook(.init(url: "https://HOST/telegramUpdate", certificate: .init(dataHandler: { data })))
    } else {
        try await telegramApi.setWebhook(.init(url: "https://HOST/telegramUpdate"))
    }
}
```
Don't forget to enable certificates for [Vapor](https://docs.vapor.codes/advanced/server/) and configure ports correctly. At the moment Telegram Api supports only 443, 80, 88, 8443. Read more about webhook in the [official Telegram documentation](https://core.telegram.org/bots/api)

## Generator

Remember that this code is generated. I update it when I contact projects related to telegram bots. If you like the interface but you see that it is outdated you can update it yourself

Colonise the project or make a fork. In chrome on the official documentation page call the inspector. Execute the code from `TelegramAPIGenerator/HTMLParserForChrome.js` and copy the result to `TelegramAPIGenerator/Input.json` and then execute `TelegramAPIGenerator`. Yay your local copy is updated
