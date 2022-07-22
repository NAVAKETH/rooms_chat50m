package api

import (
	"fmt"
	"messageApp/database"
	"messageApp/model"
	"messageApp/utility"
	"time"

	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
)

type InputParamsListChat struct {
	Userid int `query:"user_id"`
	Limit  int `query:"limit"`
	Offset int `query:"offset"`
}

// @Summary สำหรับดึงคู่แชตของผู้ใช้
// @Description ดึงรายการคู่แชตของผู้ใช้ออกมาโดยเรียงตามลำดับเวลา
// @Description จำเป็นต้องระบุข้อมูลสำคัญดังนี้ `"user_id" สำหรับระบุเป้าหมายของ listchat ที่ต้องการ` และ `"limit" สำหรับระบุจำนวนสูงสุด` และ `"offset" สำหรับระบุการ skip ข้อมูล`
// @Tags Chat
// @Accept json
// @Produce json
// @Success 200 {object} model.ResponseSuccess{data=model.ReturnListChat}
// @Failure 422 {object} model.ResponseError422
// @Router /v1/listchat [get]
func ChatList(c *fiber.Ctx) error {
	p := new(InputParamsListChat)
	if err := c.QueryParser(p); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	fmt.Println(p)
	resultData := model.ReturnListChat{}
	tx1 := database.DB.Db.Table("members").Select("count(id) as id").Where("members.user_id = ?", p.Userid).Find(&resultData.Total)
	if tx1.Error != nil {
		fmt.Println(tx1.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx1.Error.Error())
	}
	tx4 := database.DB.Db.Table("members").Select("rooms.id as ID, rooms.genid as Genid, rooms.room_type as room_type, rooms.last_message as last_message, members.unread as Unread, CASE WHEN members.friend_id = 0 THEN rooms.name ELSE users.user_name END AS Name, CASE WHEN members.friend_id = 0 THEN rooms.img ELSE users.img END AS Img").Joins("INNER JOIN rooms ON members.room_id = rooms.id").Joins("LEFT JOIN users ON members.friend_id = users.id").Where("members.user_id = ?", p.Userid).Order("rooms.updated_at desc").Limit(p.Limit).Offset(p.Offset).Find(&resultData.Data)
	if tx4.Error != nil {
		fmt.Println(tx4.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx4.Error.Error())
	}
	resultData.Start = p.Offset
	resultData.End = p.Offset + p.Limit
	// for _, roomRes := range resultData.Data {
	// 	fmt.Printf("%+v\n", roomRes)
	// }
	return utility.ResponseSuccess(c, resultData)
}

// @Summary สำหรับส่งข้อความระหว่าง user ในห้องแชต
// @Description
// @Tags Chat
// @Accept json
// @Produce json
// @Param room-id path string true  "chat room id"
// @Param Payload body requestCreateRoomPayload true "ทดสอบ"
// @Success 200 {object} model.ResponseNoDataSuccess
// @Failure 422 {object} model.ResponseError422
// @Router /v1/chat/{room-id} [post]
func Chat(c *fiber.Ctx) error {
	// -----------------------
	time_total := time.Now()
	time_start := time.Now()
	// -----------------------
	type chatResult struct {
		User uint   `json:"user"`
		Text string `json:"text"`
	}
	type ReturnRoomsID struct {
		Id uint `json:"id"`
	}
	// -----------------------
	message := chatResult{}
	if err := c.BodyParser(&message); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	// -----------------------
	fmt.Println("Befor 1 Query :", time.Since(time_start))
	time_query1 := time.Now()
	returnRoomsID := new(ReturnRoomsID)
	tx := database.DB.Db.Table("rooms").Select("id").Where("genid = ?", c.Params("room")).Find(&returnRoomsID)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	fmt.Println("After 1 Query :", time.Since(time_query1))
	time_query2 := time.Now()
	// -----------------------

	message2 := model.Message{RoomID: returnRoomsID.Id, UserID: message.User, Text: message.Text}
	database.DB.Db.Create(&message2)
	fmt.Println("After 2 Query :", time_query2)

	time_query3 := time.Now()
	database.DB.Db.Model(&model.Room{}).Where("id = ?", returnRoomsID.Id).Update("LastMessage", message.Text)
	// database.DB.Db.Table()
	fmt.Println("After 3 Query :", time_query3)

	time_query4 := time.Now()
	database.DB.Db.Model(&model.Member{}).Where("room_id = ?", returnRoomsID.Id).Not("user_id = ?", message.User).UpdateColumn("unread", gorm.Expr("unread + ?", 1))
	// database.DB.Db.Table("members").UpdateColumn("unread", gorm.Expr("unread + ?", 1)).Where("room_id = ?", returnRoomsID.Id)
	// database.DB.Db.Table("members")
	fmt.Println("After 4 Query :", time_query4)
	fmt.Println("After All Query :", time_total)
	return utility.ResponseSuccess(c, nil)
}
