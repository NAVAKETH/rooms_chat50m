package api

import (
	"fmt"
	"messageApp/database"
	"messageApp/model"
	"messageApp/utility"

	"github.com/gofiber/fiber/v2"
)

type InputParmAllUser struct {
	Limit  int `query:"limit" example:"10"`
	Offset int `query:"offset" example:"0"`
}

type InputParamsListFriend struct {
	Userid int `query:"user_id" example:"1"`
	Limit  int `query:"limit" example:"10"`
	Offset int `query:"offset" example:"0"`
}

// @Summary สำหรับดึงข้อมูลผู้ใช้ทุกคนออกมา
// @Description เพื่อให้เห็นว่ามีผู้ใช้ทั้งหมดเท่าไรในระบบตอนนี้
// @Description  จำเป็นต้องระบุข้อมูลสำคัญดังนี้ `"limit" สำหรับระบุจำนวนสูงสุด` และ `"offset" สำหรับระบุการ skip ข้อมูล`
// @Tags User
// @Accept json
// @Produce json
// @Param limit   query string true "limit"
// @Param offset  query string true "offset"
// @Success 200 {object} model.ResponseSuccess{data=model.ReturnAllUser}
// @Failure 422 {object} model.ResponseError422
// @Router /v1/all_user [get]
func ListAllUser(c *fiber.Ctx) error {
	p := new(InputParmAllUser)
	if err := c.QueryParser(p); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	returnAllUser := new(model.ReturnAllUser)
	tx := database.DB.Db.Table("users").Select("id as id,user_name").Order("id asc").Limit(p.Limit).Offset(p.Offset).Find(&returnAllUser.User)
	if tx.Error != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx.Error.Error())
	}

	tx2 := database.DB.Db.Table("users").Select("count(id) as Total").Find(&returnAllUser.Total)
	if tx2.Error != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx2.Error.Error())
	}
	returnAllUser.Start = p.Offset
	returnAllUser.End = p.Limit
	return utility.ResponseSuccess(c, returnAllUser)
}

// @Summary สำหรับลิสผู้ใช้ที่เป็นเพื่อนของเป้าหมายที่กำหนด
// @Description เพื่อให้เห็นว่าผู้ใช้มีเพื่อนทั้งหมดเท่าไรในระบบตอนนี้
// @Description  จำเป็นต้องระบุข้อมูลสำคัญดังนี้ limit สำหรับระบุจำนวนสูงสุด offset สำหรับข้อมูลที่จะปล่อยผ่าน
// @Tags User
// @Accept json
// @Param limit   query string true "limit"
// @Param offset  query string true "offset"
// @Success 200 {object} model.ResponseSuccess{data=model.ReturnAllUser}
// @Failure 422 {object} model.ResponseError422
// @Router /v1/friend [get]
func ListUserMyFriend(c *fiber.Ctx) error {
	p := new(InputParamsListFriend)
	if err := c.QueryParser(p); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	returnAllUser := new(model.ReturnAllUser)
	fmt.Println(p)
	tx2 := database.DB.Db.Table("members").Select("count(rooms.id) as Total").Joins("INNER JOIN rooms ON members.room_id = rooms.id").Where("rooms.room_type = 'Personal' AND members.user_id = ?", p.Userid).Find(&returnAllUser.Total)
	if tx2.Error != nil {
		fmt.Println(tx2.Error)
	}
	tx := database.DB.Db.Table("members").Select("members.friend_id as id").Joins("INNER JOIN rooms ON members.room_id = rooms.id").Order("id asc").Limit(p.Limit).Offset(p.Offset).Where("rooms.room_type = 'Personal' AND members.user_id = ?", p.Userid).Find(&returnAllUser.User)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	returnAllUser.Start = p.Offset
	returnAllUser.End = p.Limit
	return utility.ResponseSuccess(c, returnAllUser)
}

// @Summary สำหรับลิสผู้ใช้ที่ยังไม่ได้เป็นเพื่อนกับเป้าหมายที่กำหนด
// @Description เพื่อให้เห็นว่ามีผู้ใช้ที่ยังไม่เป็นเพื่อนเท่าไรในระบบตอนนี้
// @Description  จำเป็นต้องระบุข้อมูลสำคัญดังนี้ limit สำหรับระบุจำนวนสูงสุด offset สำหรับข้อมูลที่จะปล่อยผ่าน
// @Tags User
// @Accept json
// @Param limit   query string true "limit"
// @Param offset  query string true "offset"
// @Success 200 {object} model.ResponseSuccess{data=model.ReturnAllUser}
// @Failure 422 {object} model.ResponseError422
// @Router /v1/no_friend [get]
func ListUserNotMyFriend(c *fiber.Ctx) error {
	p := new(InputParamsListFriend)
	if err := c.QueryParser(p); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	fmt.Println(p)
	returnAllUser := new(model.ReturnAllUser)
	// tx2 := database.DB.Db.Table("users").Select("count(id) as Total").Not("")
	// if tx2.Error != nil {
	// 	fmt.Println(tx2.Error)

	// }
	tx := database.DB.Db.Raw("SELECT users.id as id from users where id != ? and  id not in (select members.friend_id as id from members inner join rooms on members.room_id = rooms.id WHERE rooms.room_type = 'Personal' AND members.user_id = ?) ORDER BY id asc LIMIT ? OFFSET ?", p.Userid, p.Userid, p.Limit, p.Offset).Scan(&returnAllUser.User)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	returnAllUser.Start = p.Offset
	returnAllUser.End = p.Limit
	return utility.ResponseSuccess(c, returnAllUser)
}
