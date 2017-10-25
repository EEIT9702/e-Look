package filter;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.e_Look.Course.CourseVO;
import com.e_Look.Order.model.OrderDAO;
import com.e_Look.Order.model.OrderVO;
import com.e_Look.OrderDetails.model.OrderDetailsDAO;
import com.e_Look.OrderDetails.model.OrderDetailsVO;
import com.e_Look.member.model.MemberVO;
import com.e_Look.shoppingCart.model.jdbc.ShoppingCartDAO;
import com.e_Look.shoppingCart.model.jdbc.ShoppingCartVO;

/**
 * Servlet Filter implementation class CheckOutFilter
 */

@WebFilter(filterName = "CheckOutFilter", dispatcherTypes = { DispatcherType.REQUEST })
public class CheckOutFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		if (req instanceof HttpServletRequest && resp instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) resp;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter rw = response.getWriter();

			ShoppingCartDAO scdao = new ShoppingCartDAO();
			OrderDAO orderDAO = new OrderDAO();
			OrderDetailsDAO odDAO = new OrderDetailsDAO();

			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			if(memberVO==null){
				rw.write("<script>alert('請先登入'); location.href='" + request.getContextPath() + "'</script>");
				return;
			}
			Integer memberID = memberVO.getMemberID();

			OrderVO orderVO = orderDAO.findMemberUncheckOrder(memberID);
			List<CourseVO> list = scdao.findByMemberID(memberID);
			if (orderVO == null && list.size() == 0) {
				rw.write("<script>alert('請先選購商品'); location.href='" + request.getHeader("Referer") + "'</script>");
				return;
			} else {
				if (orderVO == null) {
					orderVO = new OrderVO();
					orderVO.setMemberID(memberID);
					orderDAO.insert(orderVO);
					orderVO = orderDAO.findMemberUncheckOrder(memberID);
				}
				for (CourseVO courseVO : list) {
					ShoppingCartVO scVO = new ShoppingCartVO(memberID, courseVO);
					scdao.delete(scVO);
					OrderDetailsVO odVO = new OrderDetailsVO();
					odVO.setCourseVO(courseVO);
					odVO.setOrderID(orderVO.getOrderID());
					odVO.setOriginalPrice(courseVO.getSoldPrice());
					// 記得調整成特價後的價格
					odVO.setBuyingPrice(courseVO.getSoldPrice());

					odDAO.insert(odVO);
				}
				chain.doFilter(request, response);
				return;
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
