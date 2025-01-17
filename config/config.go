package config

type AppConfig struct {
	BasePath           string   `mapstructure:"base_path" toml:"base_path"`
	ServerPort         int      `mapstructure:"server_port" toml:"server_port"`
	BlockNumberPerReq  int      `mapstructure:"block_number_per_req" toml:"block_number_per_req"`
	DelayedBlockNumber int      `mapstructure:"delayed_block_number" toml:"delayed_block_number"`
	MaxUpdateImgSize   int64    `mapstructure:"max_upload_img_size" toml:"max_upload_img_size"`
	SignMessagePriKey  string   `mapstructure:"sign_message_pri_key" toml:"sign_message_pri_key"`
	SwaggerUrl         string   `mapstructure:"swagger_url" toml:"swagger_url"`
	MysqlConfName      string   `mapstructure:"mysql_conf_name" toml:"mysql_conf_name"`
	ScanInfoConfName   []string `mapstructure:"scan_info_conf_name" toml:"scan_info_conf_name"`
}

type MysqlConfig struct {
	User     string `mapstructure:"user" toml:"user"`
	Password string `mapstructure:"password" toml:"password"`
	Host     string `mapstructure:"host" toml:"host"`
	Port     int    `mapstructure:"port" toml:"port"`
	Name     string `mapstructure:"name" toml:"name"`
}

type ScanInfoConfig struct {
	ChainId []int    `mapstructure:"chain_id" toml:"chain_id"`
	ScanUrl []string `mapstructure:"scan_url" toml:"scan_url"`
}
