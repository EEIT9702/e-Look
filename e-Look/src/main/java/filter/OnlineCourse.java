package filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.e_Look.Course.CourseDAO;
import com.e_Look.Course.CourseVO;
import com.e_Look.buyCourse.model.BuyCourseDAO;
import com.e_Look.buyCourse.model.BuyCourseVO;
import com.e_Look.member.model.MemberService;
import com.e_Look.member.model.MemberVO;
import com.e_Look.memberBookmarks.model.MemberBookmarksService;
import com.e_Look.memberBookmarks.model.MemberBookmarksVO;

/**
 * Servlet Filter implementation class OnlineCourse
 */
@WebFilter(filterName = "OnlineCourseFilter", dispatcherTypes = { DispatcherType.REQUEST })
public class OnlineCourse implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		if (req instanceof HttpServletRequest && resp instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) resp;
			String courseID = request.getParameter("CourseID");
			if (courseID == null) {
				response.sendRedirect(request.getContextPath() + request.getServletPath() + "?CourseID=200001");
				return;
			}
			if (courseID != null) {
				CourseDAO dao = new CourseDAO();
				BuyCourseDAO dao2 = new BuyCourseDAO();
				CourseVO courseVO = dao.findByPrimaryKey(Integer.valueOf(courseID));
				MemberService service = new MemberService();
				MemberVO memberVo = service.getMember(courseVO.getMemberID());
				List<CourseVO> list = dao.findBymemberID(courseVO.getMemberID(), 2);
				HttpSession session = request.getSession();
				MemberVO memberVoOK = (MemberVO) session.getAttribute("LoginOK");
				List<BuyCourseVO> list2 = null;
				if (memberVoOK != null) {
				
						list2 = dao2.findByMemberID(memberVoOK.getMemberID());
				}
				List<MemberBookmarksVO> mBookmarkList = null;
				MemberBookmarksService memberBookmarksService=new MemberBookmarksService();
				mBookmarkList=memberBookmarksService.findPrimaryMemberBookmarks(memberVoOK.getMemberID());
				if(mBookmarkList!=null){
					
					request.setAttribute("mBookmarkList", mBookmarkList);
					
				}
				
				
				
				
					
					request.setAttribute("list", list);
					request.setAttribute("list2", list2);
					request.setAttribute("courseVO", courseVO);
					request.setAttribute("memberVo", memberVo);
					
				
				chain.doFilter(request, response);
			}
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
