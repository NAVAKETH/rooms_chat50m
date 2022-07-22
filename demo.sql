USE [demo-siamchai]
GO
/****** Object:  Table [dbo].[about]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[about](
	[about_id] [int] IDENTITY(1,1) NOT NULL,
	[image_id] [int] NOT NULL,
	[description] [text] NULL,
	[update_by] [int] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__about__3213E83FD657ECCE] PRIMARY KEY CLUSTERED 
(
	[about_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[complain]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[complain](
	[complain_id] [int] IDENTITY(1,1) NOT NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[line_id] [varchar](20) NULL,
	[line_link] [varchar](100) NULL,
	[facebook] [varchar](255) NULL,
	[facebook_link] [text] NULL,
	[address] [text] NOT NULL,
	[after_sales_contact] [varchar](50) NOT NULL,
	[update_by] [int] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__complain__3213E83F4D76C255] PRIMARY KEY CLUSTERED 
(
	[complain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[filename] [varchar](50) NULL,
	[path] [text] NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[locat_id] [int] IDENTITY(1,1) NOT NULL,
	[image_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[work_time] [varchar](100) NOT NULL,
	[address] [text] NULL,
	[province] [varchar](20) NOT NULL,
	[map] [text] NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[email] [varchar](100) NULL,
	[line_id] [varchar](20) NULL,
	[line_link] [varchar](50) NULL,
	[facebook] [varchar](255) NULL,
	[facebook_link] [text] NULL,
	[update_by] [int] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__location__3213E83F7EA6CAA6] PRIMARY KEY CLUSTERED 
(
	[locat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[log_group_id] [varchar](100) NOT NULL,
	[process] [varchar](50) NOT NULL,
	[process_dtm] [datetime] NOT NULL,
	[api_path] [varchar](max) NOT NULL,
	[body] [varchar](max) NOT NULL,
	[response] [varchar](max) NULL,
	[process_nippon] [varchar](50) NULL,
	[process_dtm_nippon] [datetime] NULL,
	[api_path_nippon] [varchar](max) NULL,
	[body_nippon] [varchar](max) NULL,
	[response_nippon] [varchar](max) NULL,
	[update_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log_backup]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_backup](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[process] [varchar](50) NOT NULL,
	[process_dtm] [datetime] NOT NULL,
	[api_path] [varchar](max) NOT NULL,
	[body] [varchar](max) NOT NULL,
	[response] [varchar](max) NULL,
	[update_at] [datetime] NOT NULL,
	[process_nippon] [varchar](50) NULL,
	[process_dtm_nippon] [datetime] NULL,
	[api_path_nippon] [varchar](max) NULL,
	[body_nippon] [varchar](max) NULL,
	[response_nippon] [varchar](max) NULL,
	[log_group_id] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log_nippon]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_nippon](
	[log_nippon_id] [int] IDENTITY(1,1) NOT NULL,
	[log_id] [int] NOT NULL,
	[process] [varchar](50) NOT NULL,
	[process_dtm] [datetime] NOT NULL,
	[api_path] [varchar](max) NOT NULL,
	[body] [varchar](max) NOT NULL,
	[response] [varchar](max) NOT NULL,
	[update_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[log_nippon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[mem_code] [varchar](100) NOT NULL,
	[device_token] [text] NOT NULL,
	[platform] [varchar](20) NOT NULL,
	[platform_ver] [varchar](100) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[emei] [varchar](20) NOT NULL,
	[update_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_log]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_log](
	[member_log_id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [int] NOT NULL,
	[mem_code] [varchar](100) NOT NULL,
	[device_token] [text] NOT NULL,
	[platform] [varchar](20) NOT NULL,
	[platform_ver] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime] NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[emei] [varchar](20) NOT NULL,
 CONSTRAINT [PK__member_l__D06742F1E16C8343] PRIMARY KEY CLUSTERED 
(
	[member_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberss]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberss](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[mem_code] [varchar](100) NOT NULL,
	[device_token] [text] NOT NULL,
	[platform] [varchar](20) NOT NULL,
	[platform_ver] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[emei] [varchar](20) NOT NULL,
 CONSTRAINT [PK__member__3213E83F05DCF7AC] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[noti_id] [int] IDENTITY(1,1) NOT NULL,
	[contract_id] [varchar](20) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [text] NOT NULL,
	[mem_code] [varchar](100) NOT NULL,
	[status] [bit] NOT NULL,
	[success] [bit] NOT NULL,
	[error] [text] NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__notifica__3213E83FB05954BB] PRIMARY KEY CLUSTERED 
(
	[noti_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[image_id] [int] NOT NULL,
	[topic] [varchar](150) NOT NULL,
	[price] [int] NOT NULL,
	[description] [text] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[update_by] [int] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__promotio__3213E83FF4EAB6B3] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[province_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate](
	[rate_id] [int] IDENTITY(1,1) NOT NULL,
	[contract_id] [varchar](20) NOT NULL,
	[mem_code] [varchar](100) NOT NULL,
	[sale_rate] [int] NOT NULL,
	[cashier_rate] [int] NOT NULL,
	[deliver_rate] [int] NOT NULL,
	[loan_rate] [int] NOT NULL,
	[sale_comment] [text] NULL,
	[cashier_comment] [text] NULL,
	[deliver_comment] [text] NULL,
	[loan_comment] [text] NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__rate__3213E83F3920A9BB] PRIMARY KEY CLUSTERED 
(
	[rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate_email]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate_email](
	[rate_email_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[update_by] [int] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__rate_ema__3213E83FB41CE642] PRIMARY KEY CLUSTERED 
(
	[rate_email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](50) NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [varchar](20) NOT NULL,
	[secret_key] [varchar](20) NULL,
	[ps] [text] NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__service__3213E83FF31EF49F] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[pname] [varchar](60) NOT NULL,
	[fname] [varchar](60) NOT NULL,
	[lname] [varchar](60) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[staff_code] [varchar](15) NULL,
	[position] [varchar](50) NULL,
	[ps] [text] NULL,
	[status] [bit] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__staff__3213E83F16130501] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[token]    Script Date: 19/07/65 16:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[token](
	[token_id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NOT NULL,
	[token_key] [text] NOT NULL,
	[token_expired] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK__token__3213E83F4802B2FD] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[about] ON 

INSERT [dbo].[about] ([about_id], [image_id], [description], [update_by], [update_at]) VALUES (10, 9853, N'<p><strong>นโยบายการคุ้มครอง?ข้อมูลส่วนบุคคล (Privacy Policy)</strong></p><p><br></p><p>	บริษัท สยามชัย เซอร์วิส จำกัด (“บริษัท”)&nbsp;ยึดมั่นการดำเนินธุรกิจอย่างมีจรรยาบรรณ เคารพและปฏิบัติตามกฎหมายที่บังคับใช้ และตระหนักถึงการได้รับความไว้วางใจจากท่านที่ใช้ผลิตภัณฑ์และบริการของบริษัท บริษัทเข้าใจดีว่าท่านต้องการความปลอดภัยในการทำธุรกรรมและการเก็บรักษาข้อมูลส่วนบุคคล</p><p>ดังนั้น บริษัทจึงให้ความสำคัญด้านการเคารพสิทธิในความเป็นส่วนตัวของท่านและการรักษาความปลอดภัยของข้อมูลส่วนบุคคลของท่าน โดยได้กำหนดนโยบาย ระเบียบ และหลักเกณฑ์ต่างๆ ในการดำเนินงานของบริษัทด้วยมาตรการที่เข้มงวดในการรักษาความปลอดภัยของข้อมูลส่วนบุคคล เพื่อให้ท่านได้มั่นใจว่า ข้อมูลส่วนบุคคลของท่านที่บริษัทได้รับจะถูกนำไปใช้ตรงตามความต้องการของท่านและถูกต้องตามกฎหมาย</p><p>นโยบายฉบับนี้มีขึ้นเพื่ออะไร</p><p><br></p><p>1. นโยบายฉบับนี้มีขึ้นเพื่อ??</p><p>นโยบายฉบับนี้ใช้เพื่อแจ้งให้ท่านในฐานะเจ้าของข้อมูลส่วนบุคคลทราบถึงวัตถุประสงค์และรายละเอียดของการเก็บรวบรวม ใช้ และ</p><p>หรือเปิดเผยข้อมูลส่วนบุคคล ตลอดจนสิทธิตามกฎหมายของท่านที่เกี่ยวข้องกับข้อมูลส่วนบุคคล</p><p><br></p><p>2. ข้อมูลส่วนบุคคลอะไรบ้างที่บริษัทเก็บรวบรวม ใช้ และ/หรือเปิดเผย</p><p>อะไรบ้างที่บริษัทเก็บรวบรวม ใช้ และ/หรือเปิดเผย</p><p>2.1 ข้อมูลส่วนบุคคล คือ ข้อมูลที่ทำให้สามารถระบุตัวตนของท่านได้ ไม่ว่าทางตรงหรือทางอ้อม ได้แก่</p><p>2.1.1 ข้อมูลส่วนบุคคลที่ท่านให้ไว้แก่บริษัทโดยตรง หรือให้ผ่านบริษัท หรือมีอยู่กับบริษัททั้งที่เกิดจากการใช้ผลิตภัณฑ์และ/หรือบริการ ติดต่อ เยี่ยมชม ค้นหา ผ่านช่องทางดิจิทัล เว็บไซต์ Call Center ผู้ที่ได้รับมอบหมาย หรือช่องทางอื่นใด</p><p>2.1.2 ข้อมูลส่วนบุคคลที่บริษัทได้รับหรือเข้าถึงได้จากแหล่งอื่นซึ่งไม่ใช่จากท่านโดยตรง เช่น หน่วยงานของรัฐ สถาบันการเงิน ผู้ให้บริการทางการเงิน พันธมิตรทางธุรกิจ บริษัทข้อมูลเครดิต และ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ผู้ให้บริการข้อมูล เป็นต้น ซึ่งบริษัทจะเก็บรวบรวมข้อมูลจากแหล่งอื่นต่อเมื่อได้รับความยินยอมจากท่านตามที่กฎหมายกำหนด เว้นแต่บริษัทมีความจำเป็นตามกรณีที่กฎหมายอนุญาต</p><p>ข้อมูลส่วนบุคคลของท่านที่บริษัทเก็บรวบรวม ใช้ และ/หรือเปิดเผย มีดังต่อไปนี้</p><p><br></p><p>1. ข้อมูลส่วนตัว เช่น ชื่อ นามสกุล อายุ วันเดือนปีเกิด สถานภาพสมรส เลขประจำตัวประชาชน เลขหนังสือเดินทาง</p><p>2. ข้อมูลการติดต่อ เช่น ที่อยู่อาศัย สถานที่ทำงาน ที่อยู่ที่ติดต่อ (สำหรับกรณีต่างจากที่อยู่อาศัย) หมายเลขโทรศัพท์ อีเมล ไอดีไลน์</p><p>3. ข้อมูลทางการเงิน เช่น มูลค่าเงินลงทุน แหล่งที่มาของเงินลงทุน เลขที่บัญชีกองทุน เลขบัญชีธนาคาร เลขบัตรเครดิต เลขบัตรเดบิตที่เกี่ยวข้องกับการทำธุรกรรมกองทุน ประวัติการรับเงินปันผล ส่วนแบ่งกำไรและผลประโยชน์ที่ได้รับจากการลงทุน รายการทรัพย์สิน ข้อมูลเกี่ยวกับจำนวนเงินที่ต้องการลงทุน ค่าใช้จ่ายรายเดือน เพื่อการวางแผนและ/หรือกำหนดนโยบายการลงทุน&nbsp;&nbsp;</p><p>4. ข้อมูลการทำธุรกรรม เช่น พอร์ตการลงทุน ข้อมูลการซื้อ/ขาย/สับเปลี่ยน รวมถึงการได้มาหรือจำหน่ายไปซึ่งหลักทรัพย์ การชำระเงินค่าซื้อหลักทรัพย์ รวมถึงการรับเงินค่าขายคืนหลักทรัพย์ การกู้ยืมเงินเพื่อซื้อหลักทรัพย์ การให้ยืมหลักทรัพย์</p><p>5. ข้อมูลอุปกรณ์หรือเครื่องมือ เช่น IP address MAC address Cookie ID</p><p>6. ข้อมูลอื่นๆ เช่น การใช้งานเว็บไซต์ เสียง ภาพนิ่ง ภาพเคลื่อนไหว และข้อมูลอื่นใดที่ถือว่าเป็นข้อมูลส่วนบุคคลภายใต้กฎหมายคุ้มครองข้อมูลส่วนบุคคล</p><p><br></p><p>2.2 ข้อมูลส่วนบุคคลที่มีความอ่อนไหว (Sensitive Data) คือ ข้อมูลส่วนบุคคลที่กฎหมายกำหนดเป็นการเฉพาะ ซึ่งบริษัทจะเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลที่มีความอ่อนไหวต่อเมื่อบริษัทได้รับความยินยอมโดยชัดแจ้งจากท่าน หรือในกรณีที่บริษัทมีความจำเป็นตามกรณีที่กฎหมายอนุญาต โดยบริษัทอาจต้องเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลข้อมูลชีวภาพ (Biometric) เช่น ข้อมูลภาพจำลองใบหน้า ข้อมูลจำลองลายนิ้วมือ ข้อมูลจำลองม่านตา ข้อมูลอัตลักษณ์เสียง เพื่อวัตถุประสงค์ในการพิสูจน์และยืนยันตัวตนของผู้ใช้บริการที่ขอสมัคร และ/หรือทำธุรกรรมผ่านช่องทางดิจิทัล เว็บไซต์ Call Center หรือช่องทางอื่นใด เป็นต้น&nbsp;</p><p>(ต่อไปในนโยบายฉบับนี้หากไม่กล่าวโดยเฉพาะเจาะจงจะเรียกข้อมูลส่วนบุคคลและข้อมูลส่วนบุคคลที่มีความอ่อนไหวที่เกี่ยวกับท่านข้างต้น รวมกันว่า “ข้อมูลส่วนบุคคล”)</p><p><br></p><p>3. บริษัทเก็บรวมรวม ใช้ และ /หรือเปิดเผยข้อมูลส่วนบุคคลของท่านเพื่อวัตถุประสงค์ใดบ้าง</p><p>3.1 เพื่อให้ท่านได้ใช้ผลิตภัณฑ์และ/หรือบริการของบริษัทได้ตรงตามวัตถุประสงค์ของท่าน และเพื่อการอื่นที่จำเป็นภายใต้กฎหมาย</p><p>3.1.1 เพื่อให้ท่านสามารถใช้ผลิตภัณฑ์และ/หรือบริการของบริษัทได้ตามความประสงค์ซึ่งท่านเป็นคู่สัญญาอยู่กับบริษัทหรือเพื่อใช้ในการดำเนินการตามคำขอของท่านก่อนใช้ผลิตภัณฑ์ และ/หรือบริการของบริษัท (Contractual Basis) เช่น</p><p>(1) การพิจารณาอนุมัติ การให้ผลิตภัณฑ์และ/หรือบริการต่างๆ เช่น การเปิดบัญชีกองทุน การจัดการและบริหารทรัพย์สิน รวมถึงการให้บริการอื่นๆ ที่เกี่ยวข้องกับการจัดการลงทุน&nbsp;&nbsp;</p><p>(2) การดำเนินการใดๆ ที่เกี่ยวข้องกับการให้ผลิตภัณฑ์และ/หรือบริการต่างๆ เช่น การประมวลผล การติดต่อ การแจ้ง การมอบงานให้แก่บุคคลอื่นที่เป็นผู้ให้บริการภายนอก การโอนสิทธิและ/หรือหน้าที่ การแจ้งเตือนการชำระค่าซื้อกองทุน การแจ้งการนำส่งผลประโยชน์ที่เกิดจากการลงทุน รวมถึงการแจ้งข้อมูลใด ๆ ที่เกี่ยวข้องหรือเนื่องมาจากการลงทุน หรือการมอบหมายให้บริหารทรัพย์สิน</p><p>3.1.2 เพื่อปฎิบัติหน้าที่ตามกฎหมายที่เกี่ยวข้องหรือใช้บังคับ (Legal Obligation) เช่น</p><p>(1) การปฏิบัติตามคำสั่งของผู้มีอำนาจตามกฎหมาย</p><p>(2) การปฏิบัติตามกฎหมายธุรกิจสถาบันการเงิน กฎหมายหลักทรัพย์และตลาดหลักทรัพย์ กฎหมายประกันชีวิต กฎหมายประกันวินาศภัย กฎหมายภาษีอากร กฎหมายป้องกันและปราบปรามการฟอกเงิน กฎหมายการป้องกันและปราบปรามการสนับสนุนทางการเงินแก่การก่อการร้ายและแพร่ขยายอาวุธที่มีอานุภาพทำลายล้างสูง กฎหมายคอมพิวเตอร์ กฎหมายล้มละลาย และกฎหมายอื่นๆ ที่บริษัทจำเป็นต้องปฏิบัติตามทั้งของในประเทศไทยและต่างประเทศ รวมถึงประกาศและระเบียบที่ออกตามกฎหมายดังกล่าว</p><p>3.1.3 เพื่อการดำเนินงานที่จำเป็นภายใต้ประโยชน์โดยชอบด้วยกฎหมายของบริษัทหรือของบุคคลหรือนิติบุคคลอื่น โดยไม่เกินขอบเขตที่ท่านสามารถคาดหมายได้อย่างสมเหตุสมผล (Legitimate Interest) เช่น</p><p>(1) การบันทึกเสียงทาง Call Center การบันทึกภาพ CCTV การแลกบัตรก่อนเข้าอาคาร</p><p>(2) การรักษาความสัมพันธ์กับลูกค้า เช่น การจัดการข้อร้องเรียน การประเมินความพึงพอใจ การดูแลลูกค้าโดยพนักงานของบริษัท การแจ้งเตือนหรือนำเสนอผลิตภัณฑ์และ/หรือบริการต่างๆ ประเภทเดียวกันกับที่ท่านมีอยู่กับบริษัทซึ่งเป็นประโยชน์กับท่าน</p><p>(3) การบริหารความเสี่ยง การกำกับตรวจสอบ การบริหารจัดการภายในองค์กร รวมถึงการส่งต่อไปยังบริษัทในเครือกิจการเดียวกันเพื่อการดังกล่าว ภายใต้นโยบายการคุ้มครองข้อมูลส่วนบุคคลของเครือกิจการ (Binding Corporate Rules)&nbsp;</p><p>(4) การทำให้ข้อมูลส่วนบุคคลเป็นข้อมูลที่ไม่สามารถระบุตัวบุคคลได้ (Anonymous Data)</p><p>(5) การป้องกัน รับมือ ลดความเสี่ยงที่อาจเกิดการกระทำการทุจริต ภัยคุกคามทางไซเบอร์ การผิดนัดชำระหนี้หรือผิดสัญญา (เช่น ข้อมูลล้มละลาย) การทำผิดกฎหมายต่างๆ (เช่น การฟอกเงิน การสนับสนุนทางการเงินแก่การก่อการร้ายและแพร่ขยายอาวุธที่มีอานุภาพทำลายล้างสูง ความผิดเกี่ยวกับทรัพย์ ชีวิต ร่างกาย เสรีภาพ หรือชื่อเสียง) ซึ่งรวมถึงการแบ่งปันข้อมูลส่วนบุคคลเพื่อยกระดับมาตรฐานการทำงานของบริษัทในเครือกิจการ/ธุรกิจเดียวกันในการป้องกัน รับมือ ลดความเสี่ยงข้างต้น</p><p>(6) การเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของกรรมการ ผู้มีอำนาจกระทำการแทน ตัวแทน ของลูกค้านิติบุคคล</p><p>(7) การติดต่อ การบันทึกภาพ การบันทึกเสียงเกี่ยวกับการจัดประชุม อบรม สันทนาการ หรือออกบูธ</p><p>(8) การเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของบุคคลที่ศาลมีคำสั่งพิทักษ์ทรัพย์</p><p>(9) การรับ-ส่งพัสดุ</p><p>3.2 เพื่อให้ท่านได้รับประโยชน์?จากการใช้ผลิตภัณฑ์และ/หรือบริการ ตามที่ท่านเลือกให้ความยินยอมไว้ เช่น</p><p>(1) เพื่อให้ท่านได้รับผลิตภัณฑ์และ/หรือบริการที่ดียิ่งขึ้น และสอดคล้องกับความต้องการของท่าน&nbsp;</p><p>(2) เพื่อให้ท่านได้รับข้อเสนอ สิทธิประโยชน์พิเศษ คำแนะนำ และข่าวสารต่างๆ รวมถึงสิทธิในการเข้าร่วมกิจกรรมพิเศษ</p><p>&nbsp;ทั้งนี้ไม่ว่าจะเป็นผลิตภัณฑ์ และ/หรือบริการ สิทธิประโยชน์ โปรโมชั่น ข่าวสาร หรือกิจกรรมพิเศษของบริษัทเอง หรือของพันธมิตรทางธุรกิจ หรือของบุคคลภายนอกที่มีความเกี่ยวข้องกับบริษัทตามแต่กรณีที่ท่านให้ความยินยอมไว้</p><p><br></p><p>4. บริษัทเปิดเผยข้อมูลข้อมูลส่วนบุคคลของท่านให้ใครบ้าง</p><p>บริษัทอาจเปิดเผยข้อมูลส่วนบุคคลของท่านให้แก่ผู้อื่นภายใต้ความยินยอมของท่านหรือภายใต้หลักเกณฑ์ที่กฎหมายอนุญาตให้เปิดเผยได้ โดยบุคคลหรือหน่วยงานที่เป็นผู้รับข้อมูลดังกล่าวจะเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่านตามขอบเขตที่ท่านได้ให้ความยินยอมหรือขอบเขตที่เกี่ยวข้องในนโยบายฉบับนี้</p><p>บริษัทจะเปิดเผยข้อมูลส่วนบุคคลของท่านให้แก่ผู้อื่นภายใต้ความยินยอมของท่านหรือฐานทางกฎหมายอื่นตามวัตถุประสงค์ที่ระบุไว้ในนโยบายฉบับนี้ เช่น ผู้ประมวลผลข้อมูลส่วนบุคคล พันธมิตรทางธุรกิจ ผู้ให้บริการภายนอก ตัวแทนของบริษัท ผู้รับจ้างช่วงงานต่อ สถาบันการเงิน ผู้สอบบัญชี ผู้ตรวจสอบภายนอก บริษัทจัดอันดับความน่าเชื่อถือ บริษัทบริหารสินทรัพย์ บริษัทข้อมูลเครดิต ผู้มีอำนาจตามกฎหมาย ผู้สนใจจะเข้ารับโอนสิทธิ และ/หรือผู้รับโอนสิทธิในธุรกรรมหรือการควบรวมกิจการต่าง ๆ ของบริษัท นิติบุคคลหรือบุคคลใดๆ ที่มีความสัมพันธ์หรือมีสัญญาอยู่กับบริษัท ซึ่งรวมตลอดถึง ผู้บริหาร พนักงาน ลูกจ้าง ผู้รับจ้าง ตัวแทน ที่ปรึกษาของบริษัทและของบุคคลหรือหน่วยงานที่เป็นผู้รับข้อมูลดังกล่าว</p><p><br></p><p>5. บริษัทส่งหรือโอนข้อมูลส่วนบุคคลของท่านไปยังต่างประเทศหรือไม่</p><p>บริษัทอาจมีความจำเป็นต้องส่งหรือโอนข้อมูลส่วนบุคคลของท่านไปยังบริษัทในเครือกิจการ/ธุรกิจเดียวกันที่อยู่ต่างประเทศ หรือไปยังผู้รับข้อมูลอื่นซึ่งเป็นส่วนหนึ่งของการดำเนินธุรกิจตามปกติของบริษัทเช่น การส่งหรือโอนข้อมูลส่วนบุคคลไปเก็บไว้บน server/cloud ในประเทศต่างๆ</p><p>กรณีที่ประเทศปลายทางมีมาตรฐานไม่เพียงพอ บริษัทจะดูแลการส่งหรือโอนข้อมูลส่วนบุคคลให้เป็นไปตามที่กฎหมายกำหนด และจะดำเนินการให้มีมาตรการคุ้มครองข้อมูลส่วนบุคคลที่เห็นว่าจำเป็นและเหมาะสมสอดคล้องกับมาตรฐานการรักษาความลับ เช่น มีข้อตกลงรักษาความลับกับผู้รับข้อมูลในประเทศดังกล่าว หรือในกรณีที่ผู้รับข้อมูลเป็นบริษัทในเครือกิจการ/ธุรกิจเดียวกัน บริษัทอาจเลือกใช้วิธีการดำเนินการให้มีนโยบายการคุ้มครองข้อมูลส่วนบุคคลที่ได้รับการตรวจสอบและรับรองจากผู้มีอำนาจตามกฎหมายที่เกี่ยวข้องและจะดำเนินการให้การส่งหรือโอนข้อมูลส่วนบุคคลไปยังบริษัทในเครือกิจการ/ธุรกิจเดียวกันที่อยู่ต่างประเทศเป็นไปตามนโยบายการคุ้มครองข้อมูลส่วนบุคคลดังกล่าวแทนการดำเนินการตามที่กฎหมายกำหนดไว้ก็ได้</p><p><br></p><p>6. บริษัทจัดเก็บข้อมูลส่วนบุคคลของท่านไว้นานเท่าใด</p><p>บริษัทจะเก็บรักษาข้อมูลส่วนบุคคลของท่านไว้ตามระยะเวลาที่จำเป็นในระหว่างที่ท่านเป็นลูกค้าหรือมีความสัมพันธ์อยู่กับบริษัทหรือตลอดระยะเวลาที่จำเป็นเพื่อให้บรรลุวัตถุประสงค์ที่เกี่ยวข้องในนโยบายฉบับนี้ ซึ่งอาจจำเป็นต้องเก็บรักษาไว้ต่อไปภายหลังจากนั้นหากมีกฎหมายกำหนดหรืออนุญาตไว้&nbsp;เช่น จัดเก็บไว้ตามกฎหมายว่าด้วยการป้องกันและปราบปรามการฟอกเงิน จัดเก็บไว้เพื่อวัตถุประสงค์ในการพิสูจน์ตรวจสอบกรณีอาจเกิดข้อพิพาทภายในอายุความตามที่กฎหมายกำหนดเป็นระยะเวลาไม่เกิน 10 ปี ทั้งนี้ บริษัทจะลบหรือทำลายข้อมูลส่วนบุคคล หรือทำให้เป็นข้อมูลที่ไม่สามารถระบุถึงตัวตนของท่านได้เมื่อหมดความจำเป็นหรือสิ้นสุดระยะเวลาดังกล่าว</p><h2><br></h2><p>7. บริษัทคุ้มครองข้อมูลส่วนบุคคลของท่านอย่างไร</p><p>บริษัทจะเก็บรักษาข้อมูลส่วนบุคคลของท่านไว้เป็นอย่างดีตามมาตรการเชิงเทคนิค (Technical Measure) และมาตรการเชิงบริหารจัดการ (Organizational Measure) เพื่อรักษาความมั่นคงปลอดภัยในการประมวลผลข้อมูลส่วนบุคคลที่เหมาะสม และเพื่อป้องกันการละเมิดข้อมูลส่วนบุคคล โดยบริษัทได้กำหนดนโยบาย ระเบียบ และหลักเกณฑ์ในการคุ้มครองข้อมูลส่วนบุคคล เช่น มาตรฐานความปลอดภัยของระบบเทคโนโลยีสารสนเทศ และมาตรการเพื่อป้องกันไม่ให้ผู้รับข้อมูลไปจากบริษัทใช้หรือเปิดเผยข้อมูลนอกวัตถุประสงค์ หรือโดยไม่มีอำนาจหรือโดยไม่ชอบ และบริษัทได้มีการปรับปรุงนโยบาย ระเบียบ และหลักเกณฑ์ดังกล่าวเป็นระยะๆ ตามความจำเป็นและเหมาะสม&nbsp;</p><p>นอกจากนี้ ผู้บริหาร พนักงาน ลูกจ้าง ผู้รับจ้าง ตัวแทน ที่ปรึกษา และผู้รับข้อมูลจากบริษัทมีหน้าที่ต้องรักษาความลับข้อมูลส่วนบุคคลตามมาตรการรักษาความลับที่บริษัทกำหนดขึ้น</p><p><br></p><p>8. สิทธิของท่านเกี่ยวกับข้อมูลส่วนบุคคลมีอะไรบ้าง</p><p>สิทธิของท่านในข้อนี้เป็นสิทธิตามกฎหมายที่ท่านควรทราบ โดยท่านสามารถขอใช้สิทธิต่างๆ ได้ภายใต้ข้อกำหนดของกฎหมาย และนโยบายที่กำหนดไว้ในขณะนี้หรือที่จะมีการแก้ไขเพิ่มเติมในอนาคต ตลอดจนหลักเกณฑ์ตามที่บริษัทกำหนดขึ้น และในกรณีท่านมีอายุไม่ครบ 20 ปีบริบูรณ์ หรือถูกจำกัดความสามารถในการทำนิติกรรมตามกฎหมาย ท่านสามารถขอใช้สิทธิโดยให้บิดาและมารดา ผู้ใช้อำนาจปกครอง หรือมีผู้อำนาจกระทำการแทนเป็นผู้แจ้งความประสงค์</p><p>&nbsp;8.1 สิทธิขอถอนความยินยอม : หากท่านได้ให้ความยินยอมให้บริษัท เก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่าน (ไม่ว่าจะเป็นความยินยอมที่ท่านให้ไว้ก่อนวันที่กฎหมายคุ้มครองข้อมูลส่วนบุคคลใช้บังคับหรือหลังจากนั้น) ท่านมีสิทธิที่จะถอนความยินยอมเมื่อใดก็ได้ตลอดระยะเวลาที่ข้อมูลส่วนบุคคลของท่านอยู่กับบริษัท เว้นแต่มีข้อจำกัดสิทธินั้นโดยกฎหมายหรือมีสัญญาที่ให้ประโยชน์แก่ท่านอยู่&nbsp;</p><p>&nbsp;ทั้งนี้ การถอนความยินยอมของท่านอาจส่งผลกระทบต่อท่านจากการใช้ผลิตภัณฑ์ และ/หรือบริการต่างๆ เช่น ท่านจะไม่ได้รับสิทธิประโยชน์ โปรโมชั่นหรือข้อเสนอใหม่ๆ ไม่ได้รับผลิตภัณฑ์หรือบริการที่ดียิ่งขึ้นและสอดคล้องกับความต้องการของท่าน หรือไม่ได้รับข้อมูลข่าวสารอันเป็นประโยชน์แก่ท่าน เป็นต้น เพื่อประโยชน์ของท่าน จึงควรศึกษาและสอบถามถึงผลกระทบก่อนเพิกถอนความยินยอม</p><p>8.2 สิทธิขอเข้าถึงข้อมูล : ท่านมีสิทธิขอเข้าถึงข้อมูลส่วนบุคคลของท่านที่อยู่ในความรับผิดชอบของบริษัทและขอให้บริษัททำสำเนาข้อมูลดังกล่าวให้แก่ท่าน รวมถึงขอให้บริษัทเปิดเผยว่าบริษัทได้ข้อมูลส่วนบุคคลของท่านมาได้อย่างไร</p><p>8.3 สิทธิขอถ่ายโอนข้อมูล : ท่านมีสิทธิขอรับข้อมูลส่วนบุคคลของท่านในกรณีที่บริษัทได้จัดทำข้อมูลส่วนบุคคลนั้นอยู่ในรูปแบบให้สามารถอ่านหรือใช้งานได้ด้วยเครื่องมือหรืออุปกรณ์ที่ทำงานได้โดยอัตโนมัติ และสามารถใช้หรือเปิดเผยข้อมูลส่วนบุคคลได้ด้วยวิธีการอัตโนมัติ รวมทั้งมีสิทธิขอให้บริษัทส่งหรือโอนข้อมูลส่วนบุคคลในรูปแบบดังกล่าวไปยังผู้ควบคุมข้อมูลส่วนบุคคลอื่นเมื่อสามารถทำได้ด้วยวิธีการอัตโนมัติ และมีสิทธิขอรับข้อมูลส่วนบุคคลที่บริษัทส่งหรือโอนข้อมูลส่วนบุคคลในรูปแบบดังกล่าวไปยังผู้ควบคุมข้อมูลส่วนบุคคลอื่นโดยตรง เว้นแต่ไม่สามารถดำเนินการได้เพราะเหตุทางเทคนิค&nbsp;</p><p>ทั้งนี้ ข้อมูลส่วนบุคคลของท่านข้างต้นต้องเป็นข้อมูลส่วนบุคคลที่ท่านได้ให้ความยินยอมแก่บริษัทในการเก็บรวบรวม ใช้ และ/หรือเปิดเผย หรือเป็นข้อมูลส่วนบุคคลที่บริษัทจำเป็นต้องเก็บรวบรวม ใช้ และ/หรือเปิดเผยเพื่อให้ท่านสามารถใช้ผลิตภัณฑ์และ/หรือบริการของบริษัทได้ตามความประสงค์ซึ่งท่านเป็นคู่สัญญาอยู่กับบริษัท หรือเพื่อใช้ในการดำเนินการตามคำขอของท่านก่อนใช้ผลิตภัณฑ์และ/หรือบริการของบริษัท หรือเป็นข้อมูลส่วนบุคคลอื่นตามที่ผู้มีอำนาจตามกฎหมายกำหนด</p><p>8.4 สิทธิขอคัดค้าน : ท่านมีสิทธิขอคัดค้านการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่านในเวลาใดก็ได้ หากการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่านที่ทำขึ้นเพื่อการดำเนินงานที่จำเป็นภายใต้ประโยชน์โดยชอบด้วยกฎหมายของบริษัทหรือของบุคคลหรือนิติบุคคลอื่น โดยไม่เกินขอบเขตที่ท่านสามารถคาดหมายได้อย่างสมเหตุสมผล หรือเพื่อดำเนินการตามภารกิจเพื่อสาธารณประโยชน์ หากท่านยื่นคัดค้าน บริษัทจะยังคงดำเนินการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่านต่อไปเฉพาะที่บริษัทสามารถแสดงเหตุผลตามกฎหมายได้ว่ามีความสำคัญยิ่งกว่าสิทธิขั้นพื้นฐานของท่าน หรือเป็นไปเพื่อการยืนยันสิทธิตามกฎหมาย การปฏิบัติตามกฎหมาย หรือการต่อสู้ในการฟ้องร้องตามกฎหมาย ตามแต่ละกรณี&nbsp;</p><p>นอกจากนี้ ท่านยังมีสิทธิขอคัดค้านการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่านที่ทำขึ้นเพื่อวัตถุประสงค์เกี่ยวกับการตลาด หรือเพื่อวัตถุประสงค์เกี่ยวกับการศึกษาวิจัยทางวิทยาศาสตร์ ประวัติศาสตร์ หรือสถิติได้อีกด้วย</p><p>8.5 สิทธิขอให้ลบหรือทำลายข้อมูล : ท่านมีสิทธิขอลบหรือทำลายข้อมูลส่วนบุคคลของท่าน หรือทำให้ข้อมูลส่วนบุคคลเป็นข้อมูลที่ไม่สามารถระบุตัวท่านได้ หากท่านเชื่อว่าข้อมูลส่วนบุคคลของท่านถูกเก็บรวบรวม ใช้ และ/หรือเปิดเผยโดยไม่ชอบด้วยกฎหมายที่เกี่ยวข้อง หรือเห็นว่าบริษัทหมดความจำเป็นในการเก็บรักษาไว้ตามวัตถุประสงค์ที่เกี่ยวข้องในนโยบายฉบับนี้ หรือเมื่อท่านได้ใช้สิทธิขอถอนความยินยอมหรือใช้สิทธิขอคัดค้านตามที่แจ้งไว้ข้างต้นแล้ว</p><p>8.6 สิทธิขอให้ระงับการใช้ข้อมูล : ท่านมีสิทธิขอให้ระงับการใช้ข้อมูลส่วนบุคคลชั่วคราวในกรณีที่บริษัทอยู่ระหว่างตรวจสอบตามคำร้องขอใช้สิทธิขอแก้ไขข้อมูลส่วนบุคคลหรือขอคัดค้านของท่าน หรือกรณีอื่นใดที่บริษัทหมดความจำเป็นและต้องลบหรือทำลายข้อมูลส่วนบุคคลของท่านตามกฎหมายที่เกี่ยวข้องแต่ท่านขอให้บริษัทระงับการใช้แทน</p><p>8.7 สิทธิขอให้แก้ไขข้อมูล : ท่านมีสิทธิขอแก้ไขข้อมูลส่วนบุคคลของท่านให้ถูกต้อง เป็นปัจจุบัน สมบูรณ์ และไม่ก่อให้เกิดความเข้าใจผิด</p><p>8.8 สิทธิร้องเรียน : ท่านมีสิทธิร้องเรียนต่อผู้มีอำนาจตามกฎหมายที่เกี่ยวข้อง หากท่านเชื่อว่าการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่านเป็นการกระทำในลักษณะที่ฝ่าฝืนหรือไม่ปฏิบัติตามกฎหมายที่เกี่ยวข้อง</p><p>8.9 การใช้สิทธิ : การใช้สิทธิของท่านดังกล่าวข้างต้นอาจถูกจำกัดภายใต้กฎหมายที่เกี่ยวข้อง และมีบางกรณีที่มีเหตุจำเป็นที่บริษัทอาจปฏิเสธหรือไม่สามารถดำเนินการตามคำขอใช้สิทธิข้างต้นของท่านได้ เช่น ต้องปฏิบัติตามกฎหมายหรือคำสั่งศาล เพื่อประโยชน์สาธารณะ การใช้สิทธิอาจละเมิดสิทธิหรือเสรีภาพของบุคคลอื่น เป็นต้น หากบริษัทปฏิเสธ คำขอข้างต้น บริษัทจะแจ้งเหตุผลของการปฏิเสธให้ท่านทราบด้วย ทั้งนี้ ท่านสามารถดำเนินการขอใช้สิทธิต่างๆ</p><p><br></p><p>โทรสายด่วนที่เบอร์ : 080-072-8918</p>', 143, CAST(N'2022-06-30T11:41:36.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[about] OFF
GO
SET IDENTITY_INSERT [dbo].[complain] ON 

INSERT [dbo].[complain] ([complain_id], [phone], [email], [line_id], [line_link], [facebook], [facebook_link], [address], [after_sales_contact], [update_by], [update_at]) VALUES (14, N'080-072-8918', N'siamchai.app@gmail.com', N'@sccs', N'https://line.me/R/ti/p/%40146gukxj', N'Siamchai Customer Service', N'https://www.facebook.com/siamchai.customerservice/', N'11,9 ซอยรังสิต-ปทุมธานี 3  ต.ประชาธิปัตย์   อ.ธัญบุรี  จ.ปทุมธานี 12130', N'085-822-6662', 143, CAST(N'2021-10-27T12:00:35.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[complain] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 
INSERT [dbo].[image] ([image_id], [filename], [path], [update_at]) VALUES (649, N'ภาพหน้าจอ 2563-10-27 เวลา 17.39.27.png', N'src/main/resources/image/2020-10-28T14-06-16.721895 %E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B8%88%E0%B8%AD+2563-10-27+%E0%B9%80%E0%B8%A7%E0%B8%A5%E0%B8%B2+17.39.27.png', CAST(N'2020-10-28T14:06:16.753' AS DateTime))
INSERT [dbo].[image] ([image_id], [filename], [path], [update_at]) VALUES (653, N'สุโขทัย.jpg', N'src/main/resources/image/2020-11-04T09-26-38.533378 %E0%B8%AA%E0%B8%B8%E0%B9%82%E0%B8%82%E0%B8%97%E0%B8%B1%E0%B8%A2.jpg', CAST(N'2020-11-04T09:26:38.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[location] ON 

INSERT [dbo].[location] ([locat_id], [image_id], [name], [work_time], [address], [province], [map], [phone], [email], [line_id], [line_link], [facebook], [facebook_link], [update_by], [update_at]) VALUES (1289, 3843, N'สยามชัย สาขาสำนักงานใหญ่(ปาริมา)', N'08.00-20.00', N'41 ซ.รังสิต-นครนายก46 ตำบล ประชาธิปัตย์ อำเภอ ธัญบุรี จ.ปทุมธานี  12130', N'ปทุมธานี', N'https://www.google.com/maps/place/%E0%B8%AA%E0%B8%A2%E0%B8%B2%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B8%A2/@13.984372,100.6421383,17z/data=!3m1!4b1!4m5!3m4!1s0x311d7fa005d50a3f:0x19bc13d01347a3a7!8m2!3d13.984372!4d100.644327', N'080-072-8918', N'siamchaiofficial.info@gmail.com', N'@sccs', N'https://line.me/R/ti/p/%40146gukxj', N'สยามชัยทั่วไทย', N'https://www.facebook.com/siamchai.customerservice/', 143, CAST(N'2022-01-19T09:41:29.503' AS DateTime))
SET IDENTITY_INSERT [dbo].[location] OFF
GO
SET IDENTITY_INSERT [dbo].[log] ON 
INSERT [dbo].[log] ([log_id], [log_group_id], [process], [process_dtm], [api_path], [body], [response], [process_nippon], [process_dtm_nippon], [api_path_nippon], [body_nippon], [response_nippon], [update_at]) VALUES (1, N'MjAyMi0wNy0xNSAyMDo1ODowMi4xNTY4NjM3MDM=9177', N'loginMobile', CAST(N'2022-07-15T20:58:02.137' AS DateTime), N'api/v1/login_mobile', N'{"password":"0894555541","username":"5100699056101"}', N'{"result":{},"message":"ดำเนินการไม่สำเร็จ","status":"FAIL"}', N'getProfile', CAST(N'2022-07-15T20:58:02.137' AS DateTime), N'securestock/ui/mobile/contract/getProfile', N'{"nation":"5100699056101","mobile":"0894555541","token":"U2FsdGVkX188CjyYLa+F+BLlwHqgMtdYuUVZXY3n+t23XDzlT56dcN19Kmvo2kdI"}', N'{"status":"not_found","data":[]}', CAST(N'2022-07-15T20:58:02.840' AS DateTime))
INSERT [dbo].[log] ([log_id], [log_group_id], [process], [process_dtm], [api_path], [body], [response], [process_nippon], [process_dtm_nippon], [api_path_nippon], [body_nippon], [response_nippon], [update_at]) VALUES (2, N'MjAyMi0wNy0xNSAyMDo1ODowMi45NzE2MzYxMzc=6688', N'loginMobile', CAST(N'2022-07-15T20:58:02.950' AS DateTime), N'api/v1/login_mobile', N'{"username":"1409901607471","password":"0950022717"}', N'{"result":{"mem_code":"MTQwOTkwMTYwNzQ3MQ\u003d\u003d","otp":"true"},"message":"ดำเนินการสำเร็จ","status":"OK"}', N'getProfile', CAST(N'2022-07-15T20:58:02.950' AS DateTime), N'securestock/ui/mobile/contract/getProfile', N'{"nation":"1409901607471","mobile":"0950022717","token":"U2FsdGVkX188CjyYLa+F+BLlwHqgMtdYuUVZXY3n+t23XDzlT56dcN19Kmvo2kdI"}', N'{"status":true,"data":{"info":{"title_name":"","cus_firstname":"ไวทยา","cus_lastname":"มุติกา","address":"42/6  ประชาธิปัตย์ ธัญบุรี ปทุมธานี 12130","mobile":"0950022717"},"close_contract":1,"open_contract":1}}', CAST(N'2022-07-15T20:58:03.667' AS DateTime))
INSERT [dbo].[log] ([log_id], [log_group_id], [process], [process_dtm], [api_path], [body], [response], [process_nippon], [process_dtm_nippon], [api_path_nippon], [body_nippon], [response_nippon], [update_at]) VALUES (3, N'MjAyMi0wNy0xNSAyMDo1ODowMi45NzE2MzYxMzc=6688', N'loginMobile', CAST(N'2022-07-15T20:58:03.653' AS DateTime), N'api/v1/login_mobile', N'{"username":"1409901607471","password":"0950022717"}', N'{"result":{"mem_code":"MTQwOTkwMTYwNzQ3MQ\u003d\u003d","otp":"true"},"message":"ดำเนินการสำเร็จ","status":"OK"}', N'checkAuth', CAST(N'2022-07-15T20:58:03.653' AS DateTime), N'securestock/ui/mobile/auth/checkAuth', N'{"tel":"0950022717","token":"U2FsdGVkX188CjyYLa+F+BLlwHqgMtdYuUVZXY3n+t23XDzlT56dcN19Kmvo2kdI"}', N'{"status":true}', CAST(N'2022-07-15T20:58:03.667' AS DateTime))
INSERT [dbo].[token] ([token_id], [service_id], [token_key], [token_expired], [update_at]) VALUES (789754, 21, N'eyJhbGciOiJIUzI1NiJ9.eyJzZXJ2aWNlRGV0YWlsIjp7InNlcnZpY2VfaWQiOjIxLCJjbGllbnRfaWQiOiJGTTAxIiwic2VjcmV0X2tleSI6IlRqckVoTjB0a3VHNnJ6OCIsInBzIjoiRnJvbnRlbmQgTW9iaWxlIElPUyIsInN0YXR1cyI6MSwidXBkYXRlX2F0IjoiMjAyMi0wNy0xOVQxNjozMTowOS4zNTQ5MTIifX0.DgiMngaw-ePm3CTNTIaKLtWKs-9p_nigLKeH4yIJllE', CAST(N'2022-07-20T16:31:09.327' AS DateTime), CAST(N'2022-07-19T16:31:09.327' AS DateTime))
SET IDENTITY_INSERT [dbo].[token] OFF
GO
ALTER TABLE [dbo].[about] ADD  CONSTRAINT [DF__about__updated_a__6B24EA82]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[complain] ADD  CONSTRAINT [DF__complain__update__6EF57B66]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[image] ADD  CONSTRAINT [DF_image_updated_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[location] ADD  CONSTRAINT [DF__location__update__73BA3083]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_process_dtm_1]  DEFAULT (getdate()) FOR [process_dtm]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_process_dtm_nippon_1]  DEFAULT (getdate()) FOR [process_dtm_nippon]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_update_at_1]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[log_backup] ADD  CONSTRAINT [DF_log_process_dtm]  DEFAULT (getdate()) FOR [process_dtm]
GO
ALTER TABLE [dbo].[log_backup] ADD  CONSTRAINT [DF_log_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[log_backup] ADD  CONSTRAINT [DF_log_process_dtm_nippon]  DEFAULT (getdate()) FOR [process_dtm_nippon]
GO
ALTER TABLE [dbo].[log_nippon] ADD  CONSTRAINT [DF_log_nippon_process_dtm]  DEFAULT (getdate()) FOR [process_dtm]
GO
ALTER TABLE [dbo].[log_nippon] ADD  CONSTRAINT [DF_log_nippon_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[member] ADD  CONSTRAINT [DF_members_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[member] ADD  CONSTRAINT [DF_members_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[member_log] ADD  CONSTRAINT [DF__member_lo__updat__44FF419A]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[memberss] ADD  CONSTRAINT [DF__member__status__4222D4EF]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[memberss] ADD  CONSTRAINT [DF__member__updated___76969D2E]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[notification] ADD  CONSTRAINT [DF_notification_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[notification] ADD  CONSTRAINT [DF__notificat__updat__797309D9]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[promotion] ADD  CONSTRAINT [DF__promotion__updat__7C4F7684]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[province] ADD  CONSTRAINT [DF_province_updated_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[rate] ADD  CONSTRAINT [DF__rate__updated_at__7F2BE32F]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[rate_email] ADD  CONSTRAINT [DF__rate_emai__updat__02084FDA]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[role] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[service] ADD  CONSTRAINT [DF_service_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[service] ADD  CONSTRAINT [DF__service__updated__04E4BC85]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[staff] ADD  CONSTRAINT [DF_staff_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[staff] ADD  CONSTRAINT [DF__staff__updated_a__07C12930]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[token] ADD  CONSTRAINT [DF__token__updated_a__0A9D95DB]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[about]  WITH CHECK ADD  CONSTRAINT [FK__about__image_id__0B91BA14] FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([image_id])
GO
ALTER TABLE [dbo].[about] CHECK CONSTRAINT [FK__about__image_id__0B91BA14]
GO
ALTER TABLE [dbo].[about]  WITH CHECK ADD  CONSTRAINT [FK__about__update_by__119F9925] FOREIGN KEY([update_by])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[about] CHECK CONSTRAINT [FK__about__update_by__119F9925]
GO
ALTER TABLE [dbo].[complain]  WITH CHECK ADD  CONSTRAINT [FK__complain__update__1293BD5E] FOREIGN KEY([update_by])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[complain] CHECK CONSTRAINT [FK__complain__update__1293BD5E]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK__location__image_id] FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([image_id])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK__location__image_id]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK__location__update__1387E197] FOREIGN KEY([update_by])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK__location__update__1387E197]
GO
ALTER TABLE [dbo].[log_nippon]  WITH CHECK ADD  CONSTRAINT [fk_inv_log_id] FOREIGN KEY([log_id])
REFERENCES [dbo].[log_backup] ([log_id])
GO
ALTER TABLE [dbo].[log_nippon] CHECK CONSTRAINT [fk_inv_log_id]
GO
ALTER TABLE [dbo].[member_log]  WITH CHECK ADD  CONSTRAINT [FK__member_lo__membe__5629CD9C] FOREIGN KEY([member_id])
REFERENCES [dbo].[memberss] ([member_id])
GO
ALTER TABLE [dbo].[member_log] CHECK CONSTRAINT [FK__member_lo__membe__5629CD9C]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD  CONSTRAINT [FK__promotion__image__0D7A0286] FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([image_id])
GO
ALTER TABLE [dbo].[promotion] CHECK CONSTRAINT [FK__promotion__image__0D7A0286]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD  CONSTRAINT [FK__promotion__updat__147C05D0] FOREIGN KEY([update_by])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[promotion] CHECK CONSTRAINT [FK__promotion__updat__147C05D0]
GO
ALTER TABLE [dbo].[rate_email]  WITH CHECK ADD  CONSTRAINT [FK__rate_emai__updat__184C96B4] FOREIGN KEY([update_by])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[rate_email] CHECK CONSTRAINT [FK__rate_emai__updat__184C96B4]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK__staff__role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK__staff__role_id]
GO
ALTER TABLE [dbo].[token]  WITH CHECK ADD  CONSTRAINT [FK__token__service_id] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[token] CHECK CONSTRAINT [FK__token__service_id]
GO
