package com.action;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class UpServlet extends HttpServlet {

    private ServletConfig config;

    public UpServlet() {
        super();
    }

    final public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    final public ServletConfig getServletConfig() {
        return config;
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

        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        response.setContentType(Constant.CONTENTTYPE);
        String date2 = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        String method = "";

        ComBean cb = new ComBean();
        SmartUpload mySmartUpload = new SmartUpload();
        int count = 0;
        HttpSession session = request.getSession();
        try {
            mySmartUpload.initialize(config, request, response);
            mySmartUpload.upload();
            method = mySmartUpload.getRequest().getParameter("method").trim();
            if (method.equals("addfiles")) {          // 上传文件
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String title = mySmartUpload.getRequest().getParameter("title");
                String description = mySmartUpload.getRequest().getParameter("description");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                int flag = cb.comUp("insert into files(title,url,description,addtime,users,dw) values('" + title + "','" + path + "/" + file.getFileName() + "','" + description + "','" + date2 + "','" + username + "','" + dw + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                }
            } else if (method.equals("upfiles")) {     //修改文件
                String id = mySmartUpload.getRequest().getParameter("id");
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String title = mySmartUpload.getRequest().getParameter("title");
                String description = mySmartUpload.getRequest().getParameter("description");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                if (count == 0) {
                    int flag = cb.comUp("update files set title='" + title + "',description='" + description + "',addtime='" + date2 + "',users='" + username + "',dw='" + dw + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    }
                } else {
                    int flag = cb.comUp("update files set title='" + title + "',url='" + path + "/" + file.getFileName() + "',description='" + description + "',addtime='" + date2 + "',users='" + username + "',dw='" + dw + "' where id='" + id + "' ");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    }
                }
            } else if (method.equals("addcards")) {          // 添加办卡人员
                String username = (String) session.getAttribute("user");
                String name = mySmartUpload.getRequest().getParameter("name");
                String start = mySmartUpload.getRequest().getParameter("start");
                String end = mySmartUpload.getRequest().getParameter("end");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                int flag = cb.comUp("insert into cards(name,start,end,url,users,addtime) " +
                        "values('" + name + "','" + start + "','" + end + "','" + path + "/" + file.getFileName() + "','" + username + "','" + date2 + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                }
            } else if (method.equals("upcards")) {         //修改办卡人员
                String id = mySmartUpload.getRequest().getParameter("id");
                String username = (String) session.getAttribute("user");
                String name = mySmartUpload.getRequest().getParameter("name");
                String start = mySmartUpload.getRequest().getParameter("start");
                String end = mySmartUpload.getRequest().getParameter("end");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                if (count == 0) {
                    int flag = cb.comUp("update cards set name='" + name + "',start='" + start + "',end='" + end + "'," +
                            "users='" + username + "',addtime='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    }
                } else {
                    int flag = cb.comUp("update cards set name='" + name + "',start='" + start + "',end='" + end + "'," +
                            "url='" + path + "/" + file.getFileName() + "',users='" + username + "',addtime='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    }
                }
            } else if (method.equals("addmembers")) {       //添加私教课程
                String username = (String) session.getAttribute("user");
                String name = mySmartUpload.getRequest().getParameter("name");
                String content = mySmartUpload.getRequest().getParameter("content");
                String objective = mySmartUpload.getRequest().getParameter("objective");
                String number = mySmartUpload.getRequest().getParameter("number");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                int flag = cb.comUp("insert into members(name,content,objective,number,url,users,addtime) " +
                        "values('" + name + "','" + content + "','" + objective + "','" + number + "','" + path + "/" + file.getFileName() + "','" + username + "','" + date2 + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                }
            } else if (method.equals("upmembers")) {       //修改私教课程
                String id = mySmartUpload.getRequest().getParameter("id");
                String username = (String) session.getAttribute("user");
                String name = mySmartUpload.getRequest().getParameter("name");
                String content = mySmartUpload.getRequest().getParameter("content");
                String objective = mySmartUpload.getRequest().getParameter("objective");
                String number = mySmartUpload.getRequest().getParameter("number");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                if (count == 0) {
                    int flag = cb.comUp("update members set name='" + name + "',content='" + content + "',objective='" + objective + "',number='" + number + "'," +
                            "users='" + username + "',addtime='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    }
                } else {
                    int flag = cb.comUp("update members set name='" + name + "',content='" + content + "',objective='" + objective + "',number='" + number + "'," +
                            "url='" + path + "/" + file.getFileName() + "',users='" + username + "',addtime='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    public void init() throws ServletException {

    }
}
