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
		
		
			if(method.equals("delrz")){//ɾ����־
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from rz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/systemmanager/log.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/systemmanager/log.jsp").forward(request, response);
			}
		} 
		
			else if(method.equals("bfdb")){  //����
			try {       
	            Runtime rt = Runtime.getRuntime();   
	            // ���� mysql �� cmd 
	            Process child = rt.exec("C:/Program Files (x86)/MySQL/MySQL Server 5.0/bin/mysqldump -uroot -p123  keyan");// ���õ�������Ϊutf8�����������utf8       
	                  
	            // �ѽ���ִ���еĿ���̨�����Ϣд��.sql�ļ����������˱����ļ���ע��������Կ���̨��Ϣ���ж�������ᵼ�½��̶����޷�����       
	            InputStream in = child.getInputStream();// ����̨�������Ϣ��Ϊ������       
	                              
	            InputStreamReader xx = new InputStreamReader(in, "utf8");// �������������Ϊutf8�����������utf8����������ж�������� 

	            String inStr;       
	            StringBuffer sb = new StringBuffer("");       
	            String outStr;       
	            // ��Ͽ���̨�����Ϣ�ַ���       
	            BufferedReader br = new BufferedReader(xx);       
	            while ((inStr = br.readLine()) != null) {       
	                sb.append(inStr + "\r\n");       
	            }       
	            outStr = sb.toString();       
	                  
	            // Ҫ�����������õ�sqlĿ���ļ���       
	            FileOutputStream fout = new FileOutputStream("A:/LUV.sql");
	            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");       
	            writer.write(outStr);       
	            // ע����������û��巽ʽд���ļ��Ļ����ᵼ���������룬��flush()��������Ա���       
	            writer.flush();       
	      
	            // �����ǹر����������       
	            in.close ();       
	             
	            xx.close();       
	            br.close();       
	            writer.close();       
	            fout.close();       
	      
	            request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/systemmanager/backup.jsp").forward(request, response);
	      
	        } catch (Exception e) {       
	            e.printStackTrace();  
	            request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/systemmanager/backup.jsp").forward(request, response);
	        }       
		}
		
		else if(method.equals("addtz")){  // ����֪ͨ
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("insert into tz(mc,bz,sj,yh,dw)  values('"+mc+"','"+bz+"','"+date+"','"+username+"','"+dw+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("uptz")){           //�޸�֪ͨ
			String id=request.getParameter("id");
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("update tz set mc='"+mc+"',bz='"+bz+"',sj='"+date+"',yh='"+username+"',dw='"+dw+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("deltz")){          //ɾ��֪ͨ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from tz where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("delwj")){//ɾ���ļ�
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from wj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
			}
		} 
		else if(method.equals("addfk")){       //��������ע��
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("insert into fk(mc,bz,sj,yh,dw)  values('"+mc+"','"+bz+"','"+date+"','"+username+"','"+dw+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upfk")){        //�޸ķ���
			String id=request.getParameter("id");
			String mc = request.getParameter("mc"); 
			String bz = request.getParameter("bz");  
			String username=(String)session.getAttribute("user");
			String dw=cBean.getString("select address from admin where username='"+username+"'");
			int flag = cBean.comUp("update fk set mc='"+mc+"',bz='"+bz+"',sj='"+date+"',yh='"+username+"',dw='"+dw+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delfk")){//ɾ�� ����
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
			}
		}  
		else if(method.equals("delfk2")){//ɾ�� ����
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fk where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_feedback1.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/manager/manage_feedback1.jsp").forward(request, response);
			}
		}   
		
		else if(method.equals("delxm")){//ɾ����Ŀ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xm where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
			}
		} 
		
		else if(method.equals("delxm5")){//ɾ����Ŀ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xm where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_card1.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/manager/manage_card1.jsp").forward(request, response);
			}
		} 
			


		else if(method.equals("delcg")){            //ɾ���ɹ�
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cg where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
			}
		} 
		
		else if(method.equals("delcg5")){            //ɾ���ɹ�
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cg where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/manager/manage_member1.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
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
