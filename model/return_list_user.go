package model

type ReturnAllUser struct {
	Total int `json:"total" example:"999"`
	Start int `json:"start" example:"0"`
	End   int `json:"end" example:"20"`
	User  []struct {
		Id       uint   `json:"id" example:"1"`
		UserName string `json:"username" example:"J0nh"`
	} `json:"user"`
}
