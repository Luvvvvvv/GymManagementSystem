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

  public ComServlet() {
    super();
  }

  public void destroy() {
    super.destroy();
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    response.setContentType(Constant.CONTENTTYPE);
    request.setCharacterEncoding(Constant.CHARACTERENCODING);
    HttpSession session = request.getSession();
    ComBean cBean = new ComBean();
    String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
    String method = request.getParameter("method");

    if (method.equals("delrz")) {        //ɾ����־
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from rz where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/systemmanager/log.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/systemmanager/log.jsp").forward(request, response);
      }
    } else if (method.equals("backupdb")) {  //����
      try {
        Runtime rt = Runtime.getRuntime();
        Process child = rt.exec("C:/Program Files (x86)/MySQL/MySQL Server 5.0/bin/mysqldump -uroot -p123  LUV");
        InputStream in = child.getInputStream();
        InputStreamReader xx = new InputStreamReader(in, "utf8");
        String inStr;
        StringBuffer sb = new StringBuffer("");
        String outStr;
        BufferedReader br = new BufferedReader(xx);
        while ((inStr = br.readLine()) != null) {
          sb.append(inStr + "\r\n");
        }
        outStr = sb.toString();
        FileOutputStream fout = new FileOutputStream("A:/LUV.sql");
        OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");
        writer.write(outStr);
        writer.flush();

        in.close();
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
    } else if (method.equals("addnotice")) {  // ����֪ͨ
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String username = (String) session.getAttribute("user");
      int flag = cBean.comUp("insert into notice(title,content,addtime,users)  values('" + title + "','" + content + "','" + date + "','" + username + "')");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
      }
    } else if (method.equals("upnotice")) {           //�޸�֪ͨ
      String id = request.getParameter("id");
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String username = (String) session.getAttribute("user");
      int flag = cBean.comUp("update notice set title='" + title + "',content='" + content + "',addtime='" + date + "',users='" + username + "' where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
      }
    } else if (method.equals("delnotice")) {          //ɾ��֪ͨ
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from notice where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_notice.jsp").forward(request, response);
      }
    } else if (method.equals("delfiles")) {         //ɾ���ļ�
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from files where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
      }
    } else if (method.equals("addfeedback")) {       //��ӷ���
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String username = (String) session.getAttribute("user");
      int flag = cBean.comUp("insert into feedback(title,content,addtime,users)  values('" + title + "','" + content + "','" + date + "','" + username + "')");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
      }
    } else if (method.equals("upfeedback")) {        //�޸ķ���
      String id = request.getParameter("id");
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String username = (String) session.getAttribute("user");
      int flag = cBean.comUp("update feedback set title='" + title + "',content='" + content + "',addtime='" + date + "',users='" + username + "' where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
      }
    } else if (method.equals("delfeedback")) {      //ɾ������
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from feedback where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/coach/manage_feedback.jsp").forward(request, response);
      }
    } else if (method.equals("delfeedback1")) {     //������Աɾ������
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from feedback where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_feedback1.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_feedback1.jsp").forward(request, response);
      }
    } else if (method.equals("delcards")) {       //ɾ���쿨��Ա
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from cards where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
      }
    } else if (method.equals("delcards1")) {       //������Աɾ���쿨��Ա
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from cards where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_card1.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_card1.jsp").forward(request, response);
      }
    } else if (method.equals("delmembers")) {            //ɾ��˽�̻�Ա
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from members where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
      }
    } else if (method.equals("delmembers1")) {            //����Աɾ��˽�̻�Ա
      String id = request.getParameter("id");
      int flag = cBean.comUp("delete from members where id='" + id + "'");
      if (flag == Constant.SUCCESS) {
        request.setAttribute("message", "�����ɹ���");
        request.getRequestDispatcher("admin/manager/manage_member1.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "����ʧ�ܣ�");
        request.getRequestDispatcher("admin/manager/manage_member1.jsp").forward(request, response);
      }
    }
  }

  public void init() throws ServletException {

  }
}
