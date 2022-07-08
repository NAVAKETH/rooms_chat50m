package router

import (
	"github.com/gofiber/fiber/v2"
)

func Register(c *fiber.Ctx) {
	// user := new(model.User)
	// if err := c.BodyParser(user); err != nil {
	// 	return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	// }
	// if user.UserName == "" || user.Email == "" || user.FirstName == "" || user.LastName == "" {
	// 	return fiber.NewError(fiber.StatusUnprocessableEntity, "user_name or email or first_name or last_name is null")
	// }
	// fmt.Printf("user :%v", user)
	// tx := database.DB.Db.Create(&user)

	// if tx.Error != nil {
	// 	fmt.Println(tx.Error)
	// 	return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	// }
	// return c.SendString("Success")
}
