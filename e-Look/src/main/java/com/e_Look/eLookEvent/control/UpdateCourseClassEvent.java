package com.e_Look.eLookEvent.control;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.e_Look.courseClass.CourseClassService;
import com.e_Look.courseClass.CourseClassVO;
import com.e_Look.eLookEvent.eLookEventDAO;
import com.e_Look.eLookEvent.eLookEventVO;

@WebServlet(urlPatterns = "/UpdateCourseClassEvent", loadOnStartup = 2)
public class UpdateCourseClassEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// 時間設定在當天的零點零分零秒
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		eLookEventDAO eDao = new eLookEventDAO();
		CourseClassService ccDAO = new CourseClassService();
		Date date = calendar.getTime();
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				List<eLookEventVO> elookeventVOs = eDao.getAll();
				for (eLookEventVO elookeventVO : elookeventVOs){
					if(elookeventVO.geteStartDate().getTime()<=System.currentTimeMillis() && elookeventVO.geteEndDate().getTime()+1000*60*60*24 >= System.currentTimeMillis()){
						List<CourseClassVO> ccVOs = ccDAO.getAll();
						for(CourseClassVO ccVO:ccVOs){
							if(ccVO.equals(elookeventVO.getCourseClass1()) || ccVO.equals(elookeventVO.getCourseClass2()) || ccVO.equals(elookeventVO.getCourseClass3()) ){
								ccVO.setEventVO(elookeventVO);
								ccDAO.updateEventID(ccVO);
							}
						}
						
					}
				}
			}
			// 於當日0點0分0秒開始計算 每一天做一次
		}, date, 1000 * 60 * 60 * 24);

	}

}
