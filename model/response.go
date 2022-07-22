package model

type ResponseCreateSuccess struct {
	Status  int    `json:"status" example:"201"`
	Message string `json:"message" example:"Success"`
}
type ResponseSuccess struct {
	Status  int         `json:"status" example:"200"`
	Data    interface{} `json:"data"`
	Message string      `json:"message" example:"success"`
}
type ResponseNoDataSuccess struct {
	Status  int    `json:"status" example:"200"`
	Message string `json:"message" example:"success"`
}
type ResponseError409 struct {
	Status  int    `json:"status" example:"409"`
	Message string `json:"message" example:"user_name or email is already"`
}
type ResponseError422 struct {
	Status  int    `json:"status" example:"422"`
	Message string `json:"message" example:"some error message"`
}
type ResponseError500 struct {
	Status  int    `json:"status" example:"500"`
	Message string `json:"message" example:""`
}
