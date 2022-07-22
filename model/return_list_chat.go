package model

import "time"

type ReturnListChat struct {
	Total int        `json:"total" example:"999"`
	Start int        `json:"start" example:"0"`
	End   int        `json:"end" example:"20"`
	Data  []DataUser `json:"data"`
}

type DataUser struct {
	ID          uint      `json:"id" example:"1"`
	Genid       string    `json:"gen_id" example:"ec2a2526-53f2-4fbf-8b61-1234567xxxxx"`
	RoomType    string    `json:"room_type" example:"Personal"`
	Img         string    `json:"img" example:"./abc/123.jpg"`
	Name        string    `json:"name" example:"Mr.J0nh"`
	LastMessage string    `json:"last_message" example:"hello i am J0nh"`
	Unread      int       `json:"unread" example:"999"`
	UpdateTime  time.Time `json:"update_time" example:""`
}
