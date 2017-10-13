<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/HeaderCssJs/bootstrap.css"
	rel="stylesheet">
<!-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$(".col-md-4 a").click(function() {
			$(this).tab('show');
		});
	});
</script>
<style>
/* 影片區塊 */
video {
	width: 100%;
}

video::-internal-media-controls-download-button {
	display: none;
}

video::-webkit-media-controls-enclosure {
	overflow: hidden;
}

video::-webkit-media-controls-panel {
	width: calc(100% + 30px); /* Adjust as needed */
}

#liststyle {
	margin: 50px 0;
}
#liststyle>div{
	text-align:center;
	
}

#liststyle>div>a{

	font-size:30px;
}
</style>
</head>

<body oncontextmenu="window.event.returnValue=false">
	<jsp:include page="/login.jsp" />
	<div class="container-fluid">
		<div class="container">
			<h2 align="center">videoname</h2>
			<div class="row">
				<div class="col-md-12" style="background-color: black">
					<div class="col-md-8">
						<video controls poster="poster.png">
							<source src="tri.mp4" type="video/mp4">
						</video>
					</div>

					<!-- 				<div class="navbar-header "> -->
					<!-- 					<button type="button" class="navbar-toggle" data-toggle="collapse" -->
					<!-- 						data-target="#myNavbar"> -->
					<!-- 						<span class="icon-bar"></span> <span class="icon-bar"></span> <span -->
					<!-- 							class="icon-bar"></span> -->
					<!-- 					</button> -->
					<!-- 				</div> -->
					<!-- 				<div class="collapse navbar-collapse" id="myNavbar"> -->
					<!--底下放要縮放的內容-->
					<!-- 				<div class="col-md-4 nav navbar-nav"> -->
					<!-- 						<ul class="list-group listsize "> -->
					<!-- 							<li class="list-group-item">first</li> -->
					<!-- 							<li class="list-group-item">second</li> -->
					<!-- 							<li class="list-group-item">third</li> -->
					<!-- 							<li class="list-group-item">forth</li> -->
					<!-- 							<li class="list-group-item">fifth</li> -->
					<!-- 							<li class="list-group-item">sixth</li> -->
					<!-- 							<li class="list-group-item">seventh</li> -->
					<!-- 						</ul> -->
					<!-- 					</div> -->
					<!-- 				</div> -->
				</div>
			</div>
		</div>
	</div>

	<!-- 人數、時間 等等-->
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="height: 80px">
				<div class="col-md-1">
					<img src="004-people.png">
				</div>
				<div class="col-md-1">
					<h5>課程人數</h5>
					<h5>534人</h5>
				</div>

				<div class="col-md-1">
					<img src="clock.png" height="64px">
				</div>
				<div class="col-md-1">
					<h5>課程時間</h5>
					<h5>45min</h5>
				</div>

				<div class="col-md-1">
					<img src="share.png" height="64px">
				</div>
				<div class="col-md-1">
					<h5>
						<a href="#">分享連結</a>
					</h5>
				</div>

				<div class="col-md-1">
					<img src="001-download.png" height="64px">
				</div>
				<div class="col-md-1">
					<h5>
						<a href="#">講義下載</a>
					</h5>
				</div>
				<div class="col-md-2" style="height: 64px">
					<small>課程售價</small>
					<h3>NT1230</h3>
				</div>
				<div class="col-md-2">
					<h6 align="center">星星數量位置</h6>
					<button type="button" class="btn btn-success" style="width: 160px">加入購物車</button>
				</div>
				
				<!-- list -->
				<div class="col-md-4" id="liststyle">
					<div >
						<a href="#menu1">課程簡介</a>
					</div>
				</div>
				<div class="col-md-4" id="liststyle">
					<div>
						<a href="#menu2">問題討論</a>
					</div>
				</div>
				<div class="col-md-4" id="liststyle">
					<div>
						<a href="#menu3">課程簡介</a>
					</div>
				</div>
				<!--簡介內容 -->
				<div class="tab-content ">
					<div id="menu1" class="tab-pane fade in active">

						<h3>三字經</h3>
						<p>人之初 性本善 性相近 習相遠 苟不教 性乃遷 教之道 貴以專 昔孟母 擇鄰處 子不學 斷機杼 竇燕山 有義方 教五子
							名俱揚 養不教 父之過 教不嚴 師之惰 子不學 非所宜 幼不學 老何為 玉不琢 不成器 人不學 不知義 為人子 方少時 親師友
							習禮儀 香九齡 能溫席 孝於親 所當執 融四歲 能讓梨 弟於長 宜先知 首孝弟 次見聞 知某數 識某文 一而十 十而百 百而千
							千而萬 三才者 天地人 三光者 日月星 三綱者 君臣義 父子親 夫婦順 曰春夏 曰秋冬 此四時 運不窮 曰南北 曰西東 此四方
							應乎中 曰水火 木金土 此五行 本乎數 曰仁義 禮智信 此五常 不容紊 稻粱菽 麥黍稷 此六穀 人所食 馬牛羊 雞犬豕 此六畜
							人所飼 曰喜怒 曰哀懼 愛惡欲 七情具 匏土革 木石金 與絲竹 乃八音 高曾祖 父而身 身而子 子而孫 自子孫 至玄曾 乃九族
							人之倫 父子恩 夫婦從 兄則友 弟則恭 長幼序 友與朋 君則敬 臣則忠 此十義 人所同 凡訓蒙 須講究 詳訓詁 名句讀 為學者
							必有初 小學終 至四書 論語者 二十篇 群弟子 記善言 孟子者 七篇止 講道德 說仁義 作中庸 子思筆 中不偏 庸不易 作大學
							乃曾子 自修齊 至平治 孝經通 四書熟 如六經 始可讀 詩書易 禮春秋 號六經 當講求 有連山 有歸藏 有周易 三易詳 有典謨
							有訓誥 有誓命 書之奧 我周公 作周禮 著六官 存治體 大小戴 注禮記 述聖言 禮樂備 曰國風 曰雅頌 號四詩 當諷詠 詩既亡
							春秋作 寓褒貶 別善惡 三傳者 有公羊 有左氏 有穀梁 經既明 方讀子 撮其要 記其事 五子者 有荀楊 文中子 及老莊 經子通
							讀諸史 考世系 知終始 自羲農 至黃帝 號三皇 居上世 唐有虞 號二帝 相揖遜 稱盛世 夏有禹 商有湯 周文武 稱三王 夏傳子
							家天下 四百載 遷夏社 湯伐夏 國號商 六百載 至紂亡 周武王 始誅紂 八百載 最長久 周轍東 王綱墮 逞干戈 尚遊說 始春秋
							終戰國 五霸強 七雄出 嬴秦氏 始兼并 傳二世 楚漢爭 高祖興 漢業建 至孝平 王莽篡 光武興 為東漢 四百年 終於獻 蜀魏吳
							爭漢鼎 號三國 迄兩晉 宋齊繼 梁陳承 為南朝 都金陵 北元魏 分東西 宇文周 與高齊 迨至隋 一土宇 不再傳 失統緒 唐高祖
							起義師 除隋亂 創國基 二十傳 三百載 梁滅之 國乃改 梁唐晉 及漢周 稱五代 皆有由 炎宋興 受周禪 十八傳 南北混 遼與金
							皆稱帝 元滅金 絕宋世 蒞中國 兼戎狄 九十年 國祚廢 太祖興 國大明 號洪武 都金陵 迨成祖 遷燕京 十七世 至崇禎 權閹肆
							寇如林 至李闖 神器焚 清太祖 膺景命 靖四方 克大定 廿一史 全在茲 載治亂 知興衰 讀史書 考實錄 通古今 若親目 口而誦
							心而維 朝於斯 夕於斯 昔仲尼 師項橐 古聖賢 尚勤學 趙中令 讀魯論 彼既仕 學且勤 披蒲編 削竹簡 彼無書 且知勉 頭懸梁
							錐刺股 彼不教 自勤苦 如囊螢 如映雪 家雖貧 學不輟 如負薪 如掛角 身雖勞 猶苦卓 蘇老泉 二十七 始發憤 讀書籍 彼既老
							猶悔遲 爾小生 宜早思 若梁灝 八十二 對大廷 魁多士 彼既成 眾稱異 爾小生 宜立志 瑩八歲 能詠詩 泌七歲 能賦棋 彼穎悟
							人稱奇 爾幼學 當效之 蔡文姬 能辨琴 謝道韞 能詠吟 彼女子 且聰敏 爾男子 當自警 唐劉晏 方七歲 舉神童 作正字 彼雖幼
							身己仕 爾幼學 勉而致 有為者 亦若是 犬守夜 雞司晨 苟不學 曷為人 蠶吐絲 蜂釀蜜 人不學 不如物 幼而學 壯而行 上致君
							下澤民 揚名聲 顯父母 光於前 裕於後 人遺子 金滿籯 我教子 惟一經 勤有功 戲無益 戒之哉 宜勉力</p>
					</div>
					<div id="menu2" class="tab-pane fade">
						<h3>弟子規</h3>
						<p>弟子規 聖人訓 首孝弟 次謹信 汎愛眾 而親仁 有餘力 則學文 父母呼 應勿緩 父母命 行勿懶 父母教 須敬聽 父母責
							須順承 冬則溫 夏則凊 晨則省 昏則定 出必告 反必面 居有常 業無變 事雖小 勿擅為 苟擅為 子道虧 物雖小 勿私藏 苟私藏
							親心傷 親所好 力為具 親所惡 謹為去 身有傷 貽親憂 德有傷 貽親羞 親愛我 孝何難 親憎我 孝方賢 親有過 諫使更 怡吾色
							柔吾聲 諫不入 悅復諫 號泣隨 撻無怨 親有疾 藥先嘗 晝夜侍 不離床 喪三年 常悲咽 居處變 酒肉絕 喪盡禮 祭盡誠 事死者
							如事生 兄道友 弟道恭 兄弟睦 孝在中 財物輕 怨何生 言語忍 忿自泯 或飲食 或坐走 長者先 幼者後 長呼人 即代叫 人不在
							己即到 稱尊長 勿呼名 對尊長 勿見能 路遇長 疾趨揖 長無言 退恭立 騎下馬 乘下車 過猶待 百步餘 長者立 幼勿坐 長者坐
							命乃坐 尊長前 聲要低 低不聞 卻非宜 進必趨 退必遲 問起對 視勿移 事諸父 如事父 事諸兄 如事兄</p>
					</div>
					<div id="menu3" class="tab-pane fade">
						<h3>朱子治家格言</h3>
						<p>黎明即起，灑掃庭除，要內外整潔；既昏便息，關鎖門戶，必親自檢點。一粥一飯，當思來處不易；半絲半縷，恒念物力維艱。
							宜未雨而綢繆，毋臨渴而掘井。自奉必須儉約，宴客切勿留連。器具質而潔，瓦缶勝金玉；飲食約而精，園蔬愈珍饈。勿營華屋，勿謀良田。
							三姑六婆，實淫盜之媒；婢美妾嬌，非閨房之福。童仆勿用俊美，妻妾切忌艷妝。
							祖宗雖遠，祭祀不可不誠；子孫雖愚，經書不可不讀。居身務期簡樸；教子要有義方。勿貪意外之財，勿飲過量之酒。與肩挑貿易，勿占便宜；見窮苦親鄰，須加溫恤。刻薄成家，理無久享；倫常乖舛，立見消亡。兄弟叔侄，需分多潤寡，長幼內外，宜法肅辭嚴。聽婦言，乖骨肉，豈是丈夫，重貲才，薄父母，不成人子。嫁女擇佳婿，無索重聘；娶媳求淑女，勿計厚奩。
							見富貴而生諂容者，最可恥；遇貧窮而作驕態者，賤莫甚。居家戒爭訟，訟則終兇；處世戒多言，言多必失。勿恃勢力而凌逼孤寡；勿貪口腹而恣殺生禽。乖僻自是，悔誤必多；頹隳自甘，家道難成。
							狎昵惡少，久必受其累；屈志老成，急則可相依。
							輕聽發言，安知非人之譖愬？當忍耐三思；因事相爭，焉知非我之不是？須平心暗想。施惠無念，受恩莫忘。凡事當留余地，得意不宜再往。
							人有喜慶，不可生嫉妒心；人有禍患，不可生喜幸心。善欲人見，不是真善；惡恐人知，便是大惡。見色而起淫心，報在妻女；匿怨而用暗箭，禍延子孫。家門和順，雖饔飧不繼，亦有余歡；國課早完，即囊橐無余，自得至樂。
							讀書志在圣賢，為官心存君國。守分安命，順時聽天。為人若此，庶乎近焉。</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>