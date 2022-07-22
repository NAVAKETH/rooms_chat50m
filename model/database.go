package model

import "time"

type Model struct {
	ID        uint `gorm:"primarykey"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time `gorm:"index"`
}

type User struct {
	// gorm.Model
	Model
	ID        uint   `json:"id"           gorm:"index"`
	UserName  string `json:"user_name"    gorm:"unique"`
	Img       string `json:"img"`
	Email     string `json:"emain"        gorm:"unique"`
	Password  string `json:"password"`
	FirstName string `json:"first_name"`
	LastName  string `json:"last_name"`
}

type Room struct {
	// gorm.Model
	Model
	ID          uint     `json:"id"            gorm:"index"`
	RoomType    string   `json:"room_type"`
	Genid       string   `json:"gen_id"        gorm:"unique"`
	Name        string   `json:"name"`
	Img         string   `json:"room_img"`
	Members     []Member `json:"members"       gorm:"foreignKey:RoomID"`
	LastMessage string   `json:"last_message"`
}

type Member struct {
	// gorm.Model
	Model
	ID       uint   `json:"id"    gorm:"index"`
	RoomID   uint   `json:"room_id" gorm:"index"`
	User     User   `gorm:"foreignKey:UserID"`
	UserID   uint   `json:"user_id" gorm:"index"`
	FriendID uint   `json:"friend_id"`
	Name     string `json:"name"`
	Themes   string `json:"themes"`
	Unread   int    `json:"unread"`
}

type Message struct {
	// gorm.Model
	Model
	ID     uint   `json:"id" gorm:"index"`
	Room   Room   `gorm:"foreignKey:RoomID"`
	RoomID uint   `json:"room_id"`
	User   User   `gorm:"foreignKey:UserID"`
	UserID uint   `json:"user_id"`
	Text   string `json:"text"`
}

// Last Value

// type User struct {
// 	gorm.Model
// 	ID          uint   `json:"id"        gorm:"not null"`
// 	UserName    string `json:"user_name" gorm:"unique"`
// 	Img         string `json:"img"`
// 	Email       string `json:"emain"     gorm:"unique"`
// 	Password    string `json:"password"`
// 	FirstName   string `json:"first_name"`
// 	LastName    string `json:"last_name"`
// 	CreditCards []CreditCard
// }

// type CreditCard struct {
// 	gorm.Model
// 	Number string
// 	UserID uint
// }

// type Room struct {
// 	gorm.Model
// 	ID          uint
// 	RoomID      int  `json:"uuid"`
// 	UserS       User `gorm:"foreignKey:UserSend"`
// 	UserR       User `gorm:"foreignKey:UserReceive"`
// 	UserSend    uint `json:"user_send"`
// 	UserReceive uint `json:"user_receive"`
// 	// User        User    `gorm:"ForeignKey:UserSend,UserReceive;References:ID,ID;"`
// 	LastMessage uint    `json:"last_message"`
// 	UnRead int `json:"unread"`
// }

// type Tag struct {
// 	ID     uint   `gorm:"primaryKey"`
// 	Locale string `gorm:"primaryKey"`
// 	Value  string
// }

// type Blog struct {
// 	ID         uint   `gorm:"primaryKey"`
// 	Locale     string `gorm:"primaryKey"`
// 	Subject    string
// 	Body       string
// 	Tags       []Tag `gorm:"many2many:blog_tags;"`
// 	LocaleTags []Tag `gorm:"many2many:locale_blog_tags;ForeignKey:id,locale;References:id"`
// 	SharedTags []Tag `gorm:"many2many:shared_blog_tags;ForeignKey:id;References:id"`
// }

// type Room struct {
// 	gorm.Model
// 	ID 			uint	`gorm:"not null" json:"id"`
// 	UserID		int
// 	StartDate	time.time
// }
// type Message struct {
// 	gorm.Model
// 	ID uint `gorm:"not null" json:"id"`
// 	room
// }
