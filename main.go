package main

import (
	"log"
	"messageApp/database"
	"messageApp/routes"
	"os"
	"strings"

	_ "messageApp/docs"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/spf13/viper"
)

// @title ListChat50M
// @version 1.0
// @description API ListChat demo 50m recoard database
// @contact.name Navaketh Ploypho
// @contact.url https://www.pasail.com
// @contact.email navaketh.pl@inet.co.th
// @host localhost:4000
// @BasePath /api

func main() {
	initConfig()
	database.ConnectDB()
	app := fiber.New(fiber.Config{Prefork: false})
	routes.SetUpRouter(app)
	app.Use(cors.New())
	app.Use(func(c *fiber.Ctx) error {
		return c.SendStatus(404)
	})
	log.Fatal(app.Listen(":4000"))
}

func initConfig() {
	switch os.Getenv("ENV") {
	case "":
		os.Setenv("ENV", "dev")
		viper.SetConfigName("config_dev")
	default:
		viper.SetConfigName("config")
	}

	viper.SetConfigType("yaml")
	viper.AddConfigPath(".")
	viper.AutomaticEnv()
	viper.SetEnvKeyReplacer(strings.NewReplacer(".", "_"))

	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}
}
