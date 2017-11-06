package com.e_Look.eLookEvent.control;

import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.e_Look.courseClass.CourseClassService;
import com.e_Look.courseClass.CourseClassVO;
import com.e_Look.eLookEvent.eLookEventService;
import com.e_Look.eLookEvent.eLookEventVO;

@WebServlet(urlPatterns = "/UpdateCourseClassEvent", loadOnStartup = 2)
public class UpdateCourseClassEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// 時間設定在當天的零點零分零秒
//		Calendar calendar = Calendar.getInstance();
//		calendar.set(Calendar.HOUR_OF_DAY, 0);
//		calendar.set(Calendar.MINUTE, 0);
//		calendar.set(Calendar.SECOND, 0);
		eLookEventService eventSvc = new eLookEventService();
		CourseClassService ccSvc = new CourseClassService();
//		Date date = calendar.getTime();
		Date date = new Date();

/*		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				//System.out.println("調整課程類別之活動!!!");
				List<eLookEventVO> elookeventVOs = eventSvc.getAll();
				for (eLookEventVO elookeventVO : elookeventVOs){
					if(elookeventVO.geteStartDate().getTime()<=System.currentTimeMillis() && elookeventVO.geteEndDate().getTime()+1000*60*60*24 >= System.currentTimeMillis()){
						List<CourseClassVO> ccVOs = ccSvc.getAll();
						for(CourseClassVO ccVO:ccVOs){
							//System.out.println(ccVO.getCcName()+"======"+elookeventVO.getCourseClass1());
							if("全部".equals(elookeventVO.getCourseClass1()) ||"全部".equals(elookeventVO.getCourseClass2()) ||"全部".equals(elookeventVO.getCourseClass3()) || ccVO.getCcName().equals(elookeventVO.getCourseClass1()) || ccVO.getCcName().equals(elookeventVO.getCourseClass2()) || ccVO.getCcName().equals(elookeventVO.getCourseClass3()) ){
								ccVO.setEventVO(elookeventVO);
								ccSvc.updateEventID(ccVO);
							}
						}
						
					}
				}
			}
		}, date, 1000 * 10);*/

	}

}
