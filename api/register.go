package api

import (
	"fmt"
	"messageApp/database"
	"messageApp/model"
	"messageApp/utility"

	"github.com/gofiber/fiber/v2"
)

type requestRegisterPayload struct {
	UserName  string `json:"user_name"  example:"J0nh"`
	Img       string `json:"img"        example:"./abc/123demo_path.png"`
	Email     string `json:"emain"      example:"example@mail.com"`
	Password  string `json:"password"   example:"demoPassW0rd@123!"`
	FirstName string `json:"first_name" example:"Jonh"`
	LastName  string `json:"last_name"  example:"Smith"`
}

// @Summary สำหรับเพิ่มข้อมูลงของสมาชิกเข้าสู่ระบบ
// @Description  เป็นขั้นตอนแรกสำหรับสร้างข้อมูลจำลองเข้าสู่ระบบโดยจำเป็นต้องโฟกัสข้อมูลที่ต้องสร้างหลักๆอยู่ 2 คีย์คือ `user_name` และ `emain` ที่จะต้องห้ามซ้ำกันกับข้อมูลที่เคยมีอยู่ในระบบเด็ดขาด
// @Tags Register
// @Accept json
// @Param Payload body requestRegisterPayload true "กรณี แนบ payload มาด้วย"
// @Success 201 {object} model.ResponseCreateSuccess
// @Failure 409 {object} model.ResponseError409
// @Failure 422 {object} model.ResponseError422
// @Router /v1/register [post]
func Register(c *fiber.Ctx) error {
	type RepeatData struct {
		Id uint
	}
	user := new(model.User)
	if err := c.BodyParser(user); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	if user.UserName == "" || user.Email == "" || user.FirstName == "" || user.LastName == "" {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, "user_name or email or first_name or last_name is null")
	}
	repeatData := new(RepeatData) //for check if in database have username or email will return id to this paramiter
	tx2 := database.DB.Db.Table("users").Select("id").Where("user_name = ? OR email = ?", user.UserName, user.Email).Find(&repeatData)
	if tx2.Error != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx2.Error.Error())
	}
	if repeatData.Id != 0 {
		return utility.ResponseError(c, fiber.StatusConflict, "user_name or email is already")
	}
	fmt.Printf("user :%v", user)
	tx := database.DB.Db.Create(&user)

	if tx.Error != nil {
		fmt.Println(tx.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	return c.JSON(fiber.Map{"status": 201, "message": "Success"})
}
