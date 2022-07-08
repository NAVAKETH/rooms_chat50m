package database

import (
	"context"
	"fmt"
	"messageApp/model"
	"time"

	"github.com/spf13/viper"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

type Dbinstance struct {
	Db *gorm.DB
}

var DB Dbinstance

type SqlLogger struct {
	logger.Interface
}

func (l SqlLogger) Trace(ctx context.Context, begin time.Time, fc func() (sql string, rowsAffected int64), err error) {
	sql, _ := fc() // ตัว fc จะทำการแสดงผลของตัวคำสั่งใน GORM ออกมาเป็น Query
	fmt.Printf("%v\n--------------------------------------\n", sql)
}

func ConnectDB() {
	dns := fmt.Sprintf("host=%v port=%v user=%v password=%v dbname=%v sslmode=disable TimeZone=Asia/Bangkok",
		viper.GetString("db.host"),
		viper.GetString("db.port"),
		viper.GetString("db.username"),
		viper.GetString("db.password"),
		viper.GetString("db.name"))

	db, err := gorm.Open(postgres.Open(dns), &gorm.Config{
		Logger: &SqlLogger{},
		// DryRun: true,		ตัว Dryrun หากเปิดทำงานจะเป็นการรันออกมาแบบหลอกๆไม่ได้ทำงานจริง เอาไวศึกษาการทำงานของ GORM Query
		CreateBatchSize: 1000,
	})
	if err != nil {
		panic(err)
	}
	db = db.Session(&gorm.Session{CreateBatchSize: 1000})
	fmt.Println("Connect to Database Success!")
	db.AutoMigrate(&model.User{}, &model.Room{}, &model.Message{}, model.Member{})

	DB = Dbinstance{
		Db: db,
	}
}
