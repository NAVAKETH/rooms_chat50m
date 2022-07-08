package main

import (
	"log"
	"messageApp/database"
	"messageApp/routes"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/spf13/viper"
)

func initConfig() {
	viper.SetConfigName("config") //ตั้งค่าชื่อไฟล์ที่จะดึง
	viper.SetConfigType("yaml")   //ตั้งค่านามสกุลของไฟล์ที่จะดึงค่าของ env มาใช้
	viper.AddConfigPath(".")      //กำหนด path ที่จะดึงไฟล์
	viper.AutomaticEnv()          //กำหนดให้หากมีค่าของ env ตั้งค่าอยู่แล้วจะดึงค่าของ env มาเป็นลำดับแรก

	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}
}

func setUpRoutes(app *fiber.App) {
	app.Get("/hello", routes.Hello)
	// app.Get("/getkey/:name", routes.GetValueURL)

	app.Get("/all_user", routes.ListAllUser)
	app.Get("/friend", routes.ListUserMyFriend)
	app.Get("/no_friend", routes.ListUserNotMyFriend)

	app.Post("/register", routes.Register)
	app.Post("/create_room", routes.CreateRoom)
	app.Get("/listchat", routes.ChatList)

	app.Post("/chat/:room", routes.Chat)
}

func main() {
	initConfig()
	database.ConnectDB()
	app := fiber.New(fiber.Config{Prefork: false})
	setUpRoutes(app)
	app.Use(cors.New())
	app.Use(func(c *fiber.Ctx) error {
		return c.SendStatus(404)
	})
	log.Fatal(app.Listen(":4000"))
}
