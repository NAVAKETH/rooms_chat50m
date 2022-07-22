package api

import (
	"github.com/gofiber/fiber/v2"
)

// @Summary For test api
// @Description if you call this api with GET and it return "Hello Fiber!" that api work!
// @Tags Help check
// @Router /v1/hello [get]
func Hello(c *fiber.Ctx) error {
	return c.SendString("Hello Fiber!")
}
