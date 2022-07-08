package routes

import (
	"fmt"
	"messageApp/database"
	"messageApp/model"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type ChatlistParams struct {
	Userid int `query:"user_id"`
	Limit  int `query:"limit"`
	Offset int `query:"offset"`
}

type ReturnAllUser struct {
	Total int `json:"total"`
	Start int `json:"start"`
	End   int `json:"end"`
	User  []struct {
		Id       uint   `json:"id"`
		UserName string `json:"username"`
	} `json:"user"`
}

func Hello(c *fiber.Ctx) error {
	return c.SendString("Hello Fiber!")
}
func Register(c *fiber.Ctx) error {
	type RepeatData struct {
		Id uint
	}
	user := new(model.User)
	if err := c.BodyParser(user); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	}
	if user.UserName == "" || user.Email == "" || user.FirstName == "" || user.LastName == "" {
		return fiber.NewError(fiber.StatusUnprocessableEntity, "user_name or email or first_name or last_name is null")
	}
	repeatData := new(RepeatData)
	tx2 := database.DB.Db.Table("users").Select("id").Where("user_name = ? AND email = ?", user.UserName, user.Email).Find(&repeatData)
	if tx2.Error != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx2.Error.Error())
	}
	fmt.Print("-------------------")
	fmt.Println("Show value : ", repeatData.Id)
	fmt.Print("-------------------")
	if repeatData.Id != 0 {
		return fiber.NewError(fiber.StatusUnprocessableEntity, "Username Or Email is Reprat")
	}
	fmt.Printf("user :%v", user)
	tx := database.DB.Db.Create(&user)

	if tx.Error != nil {
		fmt.Println(tx.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	return c.SendString("Success")
}
func ListAllUser(c *fiber.Ctx) error {
	type InputParm struct {
		Limit  int `query:"limit"`
		Offset int `query:"offset"`
	}

	p := new(InputParm)
	if err := c.QueryParser(p); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	}
	returnAllUser := new(ReturnAllUser)
	tx := database.DB.Db.Table("users").Select("id as id,user_name").Order("id asc").Limit(p.Limit).Offset(p.Offset).Find(&returnAllUser.User)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	}

	tx2 := database.DB.Db.Table("users").Select("count(id) as Total").Find(&returnAllUser.Total)
	if tx2.Error != nil {
		fmt.Println(tx2.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx2.Error.Error())
	}
	returnAllUser.Start = p.Offset
	returnAllUser.End = p.Limit
	fmt.Println("================")
	fmt.Println(returnAllUser)
	fmt.Println("================")
	return c.JSON(returnAllUser)
}

func ListUserMyFriend(c *fiber.Ctx) error {
	p := new(ChatlistParams)
	if err := c.QueryParser(p); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	}
	returnAllUser := new(ReturnAllUser)
	fmt.Println(p)
	tx := database.DB.Db.Table("members").Select("members.friend_id as id").Joins("INNER JOIN rooms ON members.room_id = rooms.id").Where("rooms.room_type = 'Personal' AND members.user_id = ?", p.Userid).Limit(p.Limit).Offset(p.Offset).Find(&returnAllUser.User)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	returnAllUser.Start = p.Offset
	returnAllUser.End = p.Limit
	return c.JSON(returnAllUser)
}

func ListUserNotMyFriend(c *fiber.Ctx) error {
	p := new(ChatlistParams)
	if err := c.QueryParser(p); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	}
	fmt.Println(p)
	returnAllUser := new(ReturnAllUser)
	// tx := database.DB.Db.Table("users").Select("users.id").Not("members.friend_id in ?",)
	tx := database.DB.Db.Raw("SELECT users.id as id from users where id != ? and  id not in (select members.friend_id as id from members inner join rooms on members.room_id = rooms.id WHERE rooms.room_type = 'Personal' AND members.user_id = ?)", p.Userid, p.Userid).Scan(&returnAllUser.User)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	return c.JSON(returnAllUser)
}

func CreateRoom(c *fiber.Ctx) error {
	room := new(model.Room)
	if err := c.BodyParser(room); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
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
		return fiber.NewError(fiber.StatusUnprocessableEntity, "Wrong RoomType")
	}

	tx := database.DB.Db.Create(&room)

	if tx.Error != nil {
		fmt.Println(tx.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	}

	return c.SendString("Success")
}

func ChatList(c *fiber.Ctx) error {
	type DataUser struct {
		ID          uint      `json:"id"`
		Genid       string    `json:"gen_id"`
		RoomType    string    `json:"room_type"`
		Img         string    `json:"img"`
		Name        string    `json:"name"`
		LastMessage string    `json:"last_message"`
		Unread      int       `json:"unread"`
		UpdateTime  time.Time `json:"update_time"`
	}
	type Result struct {
		Total int        `json:"total"`
		Start int        `json:"start"`
		End   int        `json:"end"`
		Data  []DataUser `json:"data"`
	}

	p := new(ChatlistParams)
	if err := c.QueryParser(p); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	}
	fmt.Println(p)
	resultData := Result{}
	tx1 := database.DB.Db.Table("members").Select("count(id) as id").Where("members.user_id = ?", p.Userid).Find(&resultData.Total)
	if tx1.Error != nil {
		fmt.Println(tx1.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx1.Error.Error())
	}
	tx4 := database.DB.Db.Table("members").Select("rooms.id as ID, rooms.genid as Genid, rooms.room_type as room_type, rooms.last_message as last_message, members.unread as Unread, CASE WHEN members.friend_id = 0 THEN rooms.name ELSE users.user_name END AS Name, CASE WHEN members.friend_id = 0 THEN rooms.img ELSE users.img END AS Img").Joins("INNER JOIN rooms ON members.room_id = rooms.id").Joins("LEFT JOIN users ON members.friend_id = users.id").Where("members.user_id = ?", p.Userid).Order("rooms.updated_at desc").Limit(p.Limit).Offset(p.Offset).Find(&resultData.Data)
	if tx4.Error != nil {
		fmt.Println(tx4.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx4.Error.Error())
	}
	resultData.Start = p.Offset
	resultData.End = p.Limit
	for _, roomRes := range resultData.Data {
		fmt.Printf("%+v\n", roomRes)
	}
	// u, err := json.Marshal(resultData)
	// if err != nil {
	// 	return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	// }
	// c.JSON(u)
	// return c.SendString(string(u))
	return c.JSON(resultData)
}

func Chat(c *fiber.Ctx) error {
	type chatResult struct {
		User uint   `json:"user"`
		Text string `json:"text"`
	}
	type ReturnRoomsID struct {
		Id uint `json:"id"`
	}
	message := chatResult{}
	if err := c.BodyParser(&message); err != nil {
		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
	}
	fmt.Println("-------------")
	fmt.Println(c.Params("room"))
	fmt.Println("-------------")
	// INSERT INTO messages (room_id,user_id,text) VALUES ((SELECT id FROM rooms WHERE genid = '61b8bad4-fe84-43bf-9197-6ee50226c80b'),2,'Hello First Chat Text!')
	// room := new(model.Room)
	returnRoomsID := new(ReturnRoomsID)
	tx := database.DB.Db.Table("rooms").Select("id").Where("genid = ?", c.Params("room")).Find(&returnRoomsID)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
	}
	message2 := model.Message{RoomID: returnRoomsID.Id, UserID: message.User, Text: message.Text}

	// fmt.Println("room: ", room)
	database.DB.Db.Create(&message2)

	database.DB.Db.Model(&model.Room{}).Where("id = ?", returnRoomsID.Id).Update("LastMessage", message.Text)
	database.DB.Db.Model(&model.Member{}).Where("room_id = ?", returnRoomsID.Id).Not("user_id = ?", message.User).UpdateColumn("unread", gorm.Expr("unread + ?", 1))

	// database.DB.Db.Where(&message{UserID: c.Params("room")}).Attrs(model.Message{"UserID": 1,"Text":"GGWP"}).FirstOrCreate(&user)
	// SELECT * FROM users WHERE name = 'non_existing' ORDER BY id LIMIT 1;
	// INSERT INTO "users" (name, age) VALUES ("non_existing", 20);
	// user -> User{ID: 112, Name: "non_existing", Age: 20}
	return nil
}

// func CreateRoom(c *fiber.Ctx) error {
// 	room := new(model.Room)
// 	room2 := new(model.Room)
// 	if err := c.BodyParser(room); err != nil {
// 		return fiber.NewError(fiber.StatusUnprocessableEntity, err.Error())
// 	}
// 	room2.UserSend = room.UserReceive
// 	room2.UserReceive = room.UserSend
// 	room2.RoomID = room.RoomID
// 	log.Println("================")
// 	log.Println(room.RoomID, room.UserSend, room.UserReceive)
// 	log.Println(room.RoomID, room.UserSend, room.UserReceive)
// 	log.Println("================")
// 	// fmt.Printf("Room : %#v", room)

// 	tx := database.DB.Db.Create(&room)
// 	if tx.Error != nil {
// 		fmt.Println(tx.Error)
// 		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
// 	}
// 	tx2 := database.DB.Db.Create(&room2)
// 	if tx2.Error != nil {
// 		fmt.Println(tx.Error)
// 		return fiber.NewError(fiber.StatusUnprocessableEntity, tx.Error.Error())
// 	}

// 	return c.SendString("Success")
// }

// func ReleaseConnection(client *Client)
