package filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseDAO;
import com.e_Look.Course.CourseVO;
import com.e_Look.member.model.MemberService;
import com.e_Look.member.model.MemberVO;
import com.e_Look.memberBookmarks.model.MemberBookmarksService;
import com.e_Look.memberBookmarks.model.MemberBookmarksVO;

@WebFilter(filterName ="MemberBookmarksFilter")
public class MemberBookmarksFilter implements Filter {

	public MemberBookmarksFilter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		if (req instanceof HttpServletRequest && resp instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) resp;

			String courseID = request.getParameter("CourseID");//why可以取
			if (courseID != null) {
				CourseDAO dao = new CourseDAO();
				CourseVO courseVO = dao.findByPrimaryKey(Integer.valueOf(courseID));
				MemberService service = new MemberService();
				MemberVO memberVo = service.getMember(courseVO.getMemberID());

				MemberBookmarksService memberBookmarksService = new MemberBookmarksService();
				List<MemberBookmarksVO> memberBookmarksVO = memberBookmarksService
						.findPrimaryMemberBookmarks(courseVO.getMemberID());

				request.setAttribute("memberBookmarksVOList", memberBookmarksVO);
				request.setAttribute("courseVO", courseVO);
				request.setAttribute("memberVo", memberVo);
				chain.doFilter(request, response);
			}else{
				response.sendRedirect(request.getContextPath()+request.getServletPath()+"?CourseID=200001");
				
			}

			
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
