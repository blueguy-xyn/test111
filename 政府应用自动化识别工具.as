
政府应用自动化识别工具
1、获取政府应用网站,使用Google search api接口
	# 配置谷歌搜索 API 密钥和 CSE ID（从环境变量加载）
	os.environ["GOOGLE_CSE_ID"] = "33a289519ce5b4209"
	os.environ["GOOGLE_API_KEY"] = "AIzaSyBBj4_uHLhHSVmmBKL0hG_OY_l_kq7ZbjA"
	怎么判断网站是否确实是应用的网站?
		先将应用变为小写去进行匹配
		如果碰到nhis.or.kr类似格式的优先直接进行访问,访问成功,直接选取该URL作为应用的真实URL
		代码实现：打分制 选取最高分的URL 
		(1)应用名匹配网站URL[一级URL]、中文应用名先转换为拼音进行匹配 全拼以及拼音首字母组合都需要进行匹配  +3分
			优先：应用名和一级域名中的第二部分完全一致,不多字母也不少字母的, +5分
		(2)应用名匹配标题、中文直接使用中文进行匹配	+2分
		如果碰到 APP,尝试提取应用的APP名称
		注
		
2、访问网站（访问网站前开启抓包）,获取 remote ip
	remote ip的获取 使用 socket.gethostbyname
3、随机点击网站（3次）, 也是获取点击页面的 remote ip
	使用playwright库
4、登陆防火墙,查询防火墙,获取识别结果
5、关闭所有网站页面,关闭抓包,保存抓包

防火墙登陆数据包：
POST /api/v1/login/ HTTP/1.1
Host: 1.1.1.1
Cookie: LOCAL_LANG_i18n=zh
Content-Length: 717
Sec-Ch-Ua-Platform: "Windows"
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36
Accept: application/json, text/plain, */*
Sec-Ch-Ua: "Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"
Content-Type: application/json;charset=UTF-8
Sec-Ch-Ua-Mobile: ?0
Origin: https://1.1.1.1
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: cors
Sec-Fetch-Dest: empty
Referer: https://1.1.1.1/
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7
Priority: u=1, i
Connection: keep-alive

{"username":"YNbxDd/M+kPRc+OTtRR7+PPGGE8jLBvaDdZOq92/x+L0mI4swn4mgiex6THy0ZW0U6HoTXxBz9aGMvC1e5RGA69MmGCcKrBA0vFMeDM8A3EbCIbUQKywnBElQaME1T4eZSWJv3xw88QT6KmahswMtOLRXJliCDKywnJeC2xuR0bgQ5YqtvoIbrxsjQIcZtloCLYN5CGWgLb4XBmnaSSMIRznYDgdUnHAEUZAx8gPUZp4eD7lyl6B7f/PpSUnppQg2KO5pDrAdr2xzuYGswznYiJ8WWUTC3NlQHkqHeroanV1bxAe2lcKSR523eCPOY8E91fcqoDFbNnavB0OEaOtpg==","password":"XOv1lM/RXvcD9l7rqPHTf21prXtWsSjBgTIOHGcI0/xgzKJV/CsLNACfJ269GYYWvnR5EiySge6VDYH8stQ8+Rw0qCf7LpOIQTfVpM5xnrMmAeuLzzyNUpww/gaA8Qw9J5gggEfAWsR8YG42q6PDWUQ8h83IFetm62fZzXRvL8TkSqPzoDuDMWiEXvVwXGEV813EPMp/BGxO4G3rKwZIWESaheppMzPCy8x1T0IaBWcRSamO7NSJmbMWMGuVAGFPmiYf63pIJN3ymvCl3xSl5zhUXyIa5YYESELJsp9dMF0jzALbQMGgbJQIpjEy7miPhHTnxt4fgI3droL/25MTiw=="}


查询操作数据包
请求包
GET /api/v1/flow_monitor/session_monitor/getSessionInfo/?page_size=10&current_page=1&create_time_num=60&create_time_type=minute&forward_src=1.1.1.1&forward_dst={获取到的remote_ip}&nat_src=&nat_dst=&forward_sport=&forward_dport=&nat_dport=&nat_sport=&pktsType=two-way&pktsCompare=more-then&pktsNum=&src_if=&dst_if=&proto=&policy_name=&app= HTTP/1.1
Host: 1.1.1.1
Cookie: LOCAL_LANG_i18n=zh; csrftoken=kV4zjpAZeJH6wKQepZcseZxkW5lhXAaSzQubDNvEah6B3A4JoKXH286968P5vis8; sessionid=l45yjbbf37haogy8anjp1dsyx6yxuz6e
Sec-Ch-Ua-Platform: "Windows"
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36
Accept: application/json, text/plain, */*
Sec-Ch-Ua: "Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"
Sec-Ch-Ua-Mobile: ?0
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: cors
Sec-Fetch-Dest: empty
Referer: https://1.1.1.1/
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7
Priority: u=1, i
Connection: keep-alive

响应包提取结果：app值


注意点：
	整个流程的先后顺序问题：先开启抓包 --- 访问网页 --- 网页持续访问中 --- 查询防火墙 --- 查询防火墙完后在关闭抓包 --- 最后关闭网站
	访问页面需要等待页面完全加载完 才算访问页面这一步骤完成
	网页访问后过几秒再查询防火墙,防火墙的查询结果要再等待几秒多刷新几次,查询完成后最后再关闭网站
	还是没有查询成功：访问网页首页,加载完成后查询防火墙,之后随机点击网页,再次查询防火墙,过几秒最后关闭网页
	

进一步修改代码：
	批量识别应用,读取put_file_here文件夹中的txt文件中的每一行应用
	关于应用的URL：
		维护一个应用的URL库,该程序为gov应用识别程序,所以维护的是gov_url.json文件
	控制台输出简化：
		应用的URL
		URL的remote ip
		remote ip的查询结果
		remote ip的查询结果和应用名进行比对：给出一致or不一致的结果


20251128代码修改
1、抓到的pcap包保存到res_cap/当天日期 文件夹中,命名：应用名_ip.pcap
2、只要查询 远程IP 在防火墙中的识别结果
3、除了提取出app值外,协议proto值也需要提取出来
4、结果json文件中也要保存查询包的响应体,结果json文件保存到res文件夹中

5、如果查询到的是 https://apps.apple.com/ 开头,URL库中就记录为 app-【应用名】,后续操作就不再进行
6、识别不一致的应用保存到error.txt中,识别一致的应用保存到right.txt应用中
7、识别的应用名如果包含APP,就直接将其应用名保存到URL库中,后续操作就不进行
8、报错
WARNING: Wireshark is installed, but cannot read manuf !
  ❌ 使用scapy生成PCAP文件时出错: unsupported operand type(s) for +: 'Ether' and 'bytes'
  ❌ 使用scapy生成PCAP文件时出错: unsupported operand type(s) for +: 'Ether' and 'bytes'
  ❌ 使用scapy生成PCAP文件时出错: unsupported operand type(s) for +: 'Ether' and 'bytes'
  ❌ 使用scapy生成PCAP文件时出错: unsupported operand type(s) for +: 'Ether' and 'bytes'
9、只要 查步骤2获取到的ip即可
10、一个应用抓到的流量都保存到一个包中：应用名_步骤2获取到的ip.pcap

11、抓到的包有问题：一个应用的抓包要从头贯穿到尾,打开应用网页前就开始抓包,关闭应用后再停止抓包,这个过程的所有流量都要抓到并保存
12、如果是app,不要保存为这个格式："app-eGovPH": "https://apps.apple.com/ph/app/egovph/id6447682225",
保存为：应用名:app-找到的URL


可视化
	