package com.action;
/**
 * 管理员登陆 增加 修改 删除  
 */
import com.bean.ComBean;
import com.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class AdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		try{
			String method=request.getParameter("method").trim();
			ComBean cBean = new ComBean();
			HttpSession session = request.getSession();
			if(method.equals("one")){        //用户登录
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String identity = request.getParameter("identity");
				String str=cBean.getString("select realname from admin where username='"+username+"' and  password='"+password+"' and  identity='"+identity+"' ");
				if(str==null){
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("index.jsp").forward(request, response); 
				}
				else{
					String ip=request.getRemoteAddr();
					 cBean.comUp("insert into rz(users,identity,addtime,ip) values('"+username+"','"+identity+"','"+date+"','"+ip+"')");
					session.setAttribute("user", username); session.setAttribute("identity", identity); 
					request.getRequestDispatcher("admin/index.jsp").forward(request, response); 
				}  
			}
			else if(method.equals("uppwd")){     //修改密码
				String username=(String)session.getAttribute("user"); 
				String oldpwd = request.getParameter("oldpwd"); 
				String newpwd = request.getParameter("newpwd"); 
				String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+oldpwd+"'");
				if(str==null){
					request.setAttribute("message", "原始密码信息错误！");
					request.getRequestDispatcher("admin/systemmanager/modifypsw.jsp").forward(request, response);
				}
				else{
					int flag=cBean.comUp("update admin set password='"+newpwd+"' where username='"+username+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/systemmanager/modifypsw.jsp").forward(request, response);
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/systemmanager/modifypsw.jsp").forward(request, response);
					}
				}
			}
			else if(method.equals("adminexit")){//退出登录
				session.removeAttribute("user");  session.removeAttribute("identity");
				request.getRequestDispatcher("index.jsp").forward(request, response); 
			}
			else if(method.equals("addmanager")){      //增加管理人员
				String username = request.getParameter("username"); 
				String password = request.getParameter("password"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String tel = request.getParameter("tel"); 
				String str=cBean.getString("select id from admin where username='"+username+"'");
				if(str==null){ 
						int flag=cBean.comUp("insert into admin(username,password,realname,sex,age,tel,addtime,identity) " +
								"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+tel+"','"+date2+"','管理人员')");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
						} 
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
				} 
			}
			else if(method.equals("upmanager")){   //修改管理人员
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");  
				int flag=cBean.comUp("update admin set password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
				}
			}
			else if(method.equals("upmanagerinfo")){      //修改管理人员信息
				String username=(String)session.getAttribute("user"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");  
				int flag=cBean.comUp("update admin set realname='"+realname+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"' where username='"+username+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/manager/manager_info.jsp").forward(request, response);
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/manager/manager_info.jsp").forward(request, response);
				}
			}
			else if(method.equals("delmanager")){      //删除管理人员
				String id = request.getParameter("id");  
				int flag=cBean.comUp("delete from admin where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/systemmanager/manage_manager.jsp").forward(request, response);
				}
			} 
			
			else if(method.equals("addcoach")){    //增加健身教练
				String username = request.getParameter("username"); 
				String password = request.getParameter("password"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age");
				String tel = request.getParameter("tel"); 
				String str=cBean.getString("select id from admin where username='"+username+"'");
				if(str==null){ 
						int flag=cBean.comUp("insert into admin(username,password,realname,sex,age,tel,addtime,identity) " +
								"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+tel+"','"+date2+"','健身教练')");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
						} 
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
				} 
			}
			else if(method.equals("upcoach")){     // 管理员修改健身教练
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");  
				int flag=cBean.comUp("update admin set password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
				}
			}
			else if(method.equals("upcoachinfo")){   //健身教练修改健身教练
				String username=(String)session.getAttribute("user"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");  
				int flag=cBean.comUp("update admin set realname='"+realname+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"' where username='"+username+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/coach/coach_info.jsp").forward(request, response);
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/coach/coach_info.jsp").forward(request, response);
				}
			}
			else if(method.equals("delcoach")){       //删除健身教练
				String id = request.getParameter("id");  
				int flag=cBean.comUp("delete from admin where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/systemmanager/manage_coach.jsp").forward(request, response);
				}
			} 
			else{      //无参数传入转到错误页面
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
