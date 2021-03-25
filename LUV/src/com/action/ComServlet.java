package com.action;

import com.bean.ComBean;
import com.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
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
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		
		
			if(method.equals("delrz")){//删除日志
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from rz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/systemmanager/log.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/systemmanager/log.jsp").forward(request, response);
			}
		} 
		
			else if(method.equals("bfdb")){  //备份
			try {       
	            Runtime rt = Runtime.getRuntime();   
	            // 调用 mysql 的 cmd 
	            Process child = rt.exec("C:/Program Files (x86)/MySQL/MySQL Server 5.0/bin/mysqldump -uroot -p123  keyan");// 设置导出编码为utf8。这里必须是utf8       
	                  
	            // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行       
	            InputStream in = child.getInputStream();// 控制台的输出信息作为输入流       
	                              
	            InputStreamReader xx = new InputStreamReader(in, "utf8");// 设置输出流编码为utf8。这里必须是utf8，否则从流中读入的是乱 

	            String inStr;       
	            StringBuffer sb = new StringBuffer("");       
	            String outStr;       
	            // 组合控制台输出信息字符串       
	            BufferedReader br = new BufferedReader(xx);       
	            while ((inStr = br.readLine()) != null) {       
	                sb.append(inStr + "\r\n");       
	            }       
	            outStr = sb.toString();       
	                  
	            // 要用来做导入用的sql目标文件：       
	            FileOutputStream fout = new FileOutputStream("A:/LUV.sql");
	            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");       
	            writer.write(outStr);       
	            // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免       
	            writer.flush();       
	      
	            // 别忘记关闭输入输出流       
	            in.close ();       
	             
	            xx.close();       
	            br.close();       
	            writer.close();       
	            fout.close();       
	      
	            request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/systemmanager/backup.jsp").forward(request, response);
	      
	        } catch (Exception e) {       
	            e.printStackTrace();  
	            request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/systemmanager/backup.jsp").forward(request, response);
	        }       
		}
		
		else if(method.equals("addtz")){  // 增加通知
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("insert into tz(mc,bz,sj,yh,dw)  values('"+mc+"','"+bz+"','"+date+"','"+username+"','"+dw+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("uptz")){           //修改通知
			String id=request.getParameter("id");
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("update tz set mc='"+mc+"',bz='"+bz+"',sj='"+date+"',yh='"+username+"',dw='"+dw+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("deltz")){          //删除通知
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from tz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("delwj")){//删除文件
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from wj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
			}
		} 
		else if(method.equals("addfk")){       //反馈代码注释
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("insert into fk(mc,bz,sj,yh,dw)  values('"+mc+"','"+bz+"','"+date+"','"+username+"','"+dw+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upfk")){        //修改反馈
			String id=request.getParameter("id");
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("update fk set mc='"+mc+"',bz='"+bz+"',sj='"+date+"',yh='"+username+"',dw='"+dw+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delfk")){//删除 反馈
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
		}  
		else if(method.equals("delfk2")){//删除 反馈
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_feedback1.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_feedback1.jsp").forward(request, response);
			}
		}   
		
		else if(method.equals("delxm")){//删除项目
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xm where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
			}
		} 
		
		else if(method.equals("delxm5")){//删除项目
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xm where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_card1.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_card1.jsp").forward(request, response);
			}
		} 
			


		else if(method.equals("delcg")){            //删除成果
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cg where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
			}
		} 
		
		else if(method.equals("delcg5")){            //删除成果
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cg where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/manager/manage_member1.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/manager/manage_member1.jsp").forward(request, response);
			}
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
