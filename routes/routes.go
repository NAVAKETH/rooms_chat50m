package routes

import (
	"messageApp/api"

	swagger "github.com/arsmn/fiber-swagger/v2"
	"github.com/gofiber/fiber/v2"
)

func SetUpRouter(app *fiber.App) {
	apiRoutes := app.Group("/api")

	v1 := apiRoutes.Group("/v1")
	v1.Get("/docs/*", swagger.New(swagger.Config{
		URL:         "doc.json",
		DeepLinking: true,
	}))

	v1.Get("/hello", api.Hello)
	v1.Get("/all_user", api.ListAllUser)
	v1.Get("/friend", api.ListUserMyFriend)
	v1.Get("/no_friend", api.ListUserNotMyFriend)
	v1.Post("/register", api.Register)
	v1.Post("/create_room", api.CreateRoom)
	v1.Get("/listchat", api.ChatList)
	v1.Post("/chat/:room", api.Chat)
}
