package api

import (
	"fmt"
	"messageApp/database"
	"messageApp/model"
	"messageApp/utility"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
)

type requestCreateRoomPayload struct {
	RoomType string `json:"room_type" example:"'Personal' or 'Group'"`
	Name     string `json:"name"`
	Members  []struct {
		UserID uint `json:"user_id"`
	} `json:"members"`
}

// @Summary สำหรับสร้างห้องแชตระหว่าง user
// @Description API สำหรับสร้างห้องแชต แบบแชตกลุ่ม และ แชตเดี่ยว
// @Description  กรณีสำหรับระบุแชตเดี่ยวให้กำหนด room_type เป็น `Personal` กรณีแชตกลุ่มให้กำหนด room_type เป็น `Group`
// @Tags Room
// @Accept json
// @Produce json
// @Param Payload body requestCreateRoomPayload true "ทดสอบ"
// @Success 200 {object} model.ResponseNoDataSuccess
// @Failure 422 {object} model.ResponseError422
// @Router /v1/create_room [post]
func CreateRoom(c *fiber.Ctx) error {
	room := new(model.Room)
	if err := c.BodyParser(room); err != nil {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, err.Error())
	}
	id := uuid.New()
	room.Genid = id.String()

	if room.RoomType == "Personal" {
		room.Members[0].FriendID = room.Members[1].UserID
		room.Members[1].FriendID = room.Members[0].UserID
		// Show Data!
		fmt.Println("================")
		fmt.Println("room type:", room.RoomType, "  room id:", room.Genid, "  room name:", room.Name)
		for _, user := range room.Members {
			fmt.Println("user id:", user.UserID, "friend id:", user.FriendID)
		}
		fmt.Println("================")

	} else if room.RoomType == "Group" {
		// Show Data!
		fmt.Println("================")
		fmt.Println("room type:", room.RoomType, "  room id:", room.Genid, "  room name:", room.Name)
		for _, user := range room.Members {
			fmt.Println("user id:", user.UserID, "friend id:", user.FriendID)
		}
		fmt.Println("================")
	} else {
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, "Wrong RoomType")
	}

	tx := database.DB.Db.Create(&room)

	if tx.Error != nil {
		fmt.Println(tx.Error)
		return utility.ResponseError(c, fiber.StatusUnprocessableEntity, tx.Error.Error())
	}

	return utility.ResponseSuccess(c, nil)
}
