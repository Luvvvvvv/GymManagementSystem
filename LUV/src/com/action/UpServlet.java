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

    /**
     * Constructor of the object.
     */
    public UpServlet() {
        super();
    }

    final public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    final public ServletConfig getServletConfig() {
        return config;
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
     * <p>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        response.setContentType(Constant.CONTENTTYPE);
        String date2 = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        String method = "";
        ;
        ComBean cb = new ComBean();
        SmartUpload mySmartUpload = new SmartUpload();//init
        int count = 0;
        HttpSession session = request.getSession();
        try {
            mySmartUpload.initialize(config, request, response);
            mySmartUpload.upload();
            method = mySmartUpload.getRequest().getParameter("method").trim();
            if (method.equals("addwj")) {// �ϴ��ļ�
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String mc = mySmartUpload.getRequest().getParameter("mc");
                String bz = mySmartUpload.getRequest().getParameter("bz");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                int flag = cb.comUp("insert into wj(mc,url,bz,sj,yh,dw) values('" + mc + "','" + path + "/" + file.getFileName() + "','" + bz + "','" + date2 + "','" + username + "','" + dw + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "�����ɹ���");
                    request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "����ʧ�ܣ�");
                    request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                }
            } else if (method.equals("upwj")) {//�޸� �ļ�
                String id = mySmartUpload.getRequest().getParameter("id");
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String mc = mySmartUpload.getRequest().getParameter("mc");
                String bz = mySmartUpload.getRequest().getParameter("bz");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                if (count == 0) {
                    int flag = cb.comUp("update wj set mc='" + mc + "',bz='" + bz + "',sj='" + date2 + "',yh='" + username + "',dw='" + dw + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "�����ɹ���");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "����ʧ�ܣ�");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    }
                } else {
                    int flag = cb.comUp("update wj set mc='" + mc + "',url='" + path + "/" + file.getFileName() + "',bz='" + bz + "',sj='" + date2 + "',yh='" + username + "',dw='" + dw + "' where id='" + id + "' ");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "�����ɹ���");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "����ʧ�ܣ�");
                        request.getRequestDispatcher("admin/manager/manage_file.jsp").forward(request, response);
                    }
                }
            } else if (method.equals("addxm")) {          // ��Ӱ쿨��Ա
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String bh = mySmartUpload.getRequest().getParameter("bh");
                String ksj = mySmartUpload.getRequest().getParameter("ksj");
                String esj = mySmartUpload.getRequest().getParameter("esj");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                int flag = cb.comUp("insert into xm(bh,ksj,esj,url,yh,dw,sj) " +
                        "values('" + bh + "','" + ksj + "','" + esj + "','" + path + "/" + file.getFileName() + "','" + username + "','" + dw + "','" + date2 + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "�����ɹ���");
                    request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "����ʧ�ܣ�");
                    request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                }
            } else if (method.equals("upxm")) {         //�޸İ쿨��Ա
                String id = mySmartUpload.getRequest().getParameter("id");
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String bh = mySmartUpload.getRequest().getParameter("bh");
                String ksj = mySmartUpload.getRequest().getParameter("ksj");
                String esj = mySmartUpload.getRequest().getParameter("esj");
                SmartFile file = mySmartUpload.getFiles().getFile(0);

                String path = "upfile";
                count = mySmartUpload.save(path);
                if (count == 0) {
                    int flag = cb.comUp("update xm set bh='" + bh + "',ksj='" + ksj + "',esj='" + esj + "'," +
                            "yh='" + username + "',dw='" + dw + "',sj='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "�����ɹ���");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "����ʧ�ܣ�");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    }
                } else {
                    int flag = cb.comUp("update xm set bh='" + bh + "',ksj='" + ksj + "',esj='" + esj + "'," +
                            "url='" + path + "/" + file.getFileName() + "',yh='" + username + "',dw='" + dw + "',sj='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "�����ɹ���");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "����ʧ�ܣ�");
                        request.getRequestDispatcher("admin/coach/manage_card.jsp").forward(request, response);
                    }
                }
            } else if (method.equals("addcg")) {       //���˽�̿γ�
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String bh = mySmartUpload.getRequest().getParameter("bh");
                String mc = mySmartUpload.getRequest().getParameter("mc");
                String xk = mySmartUpload.getRequest().getParameter("xk");
                String bz = mySmartUpload.getRequest().getParameter("bz");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                int flag = cb.comUp("insert into cg(bh,mc,xk,bz,url,yh,dw,sj) " +
                        "values('" + bh + "','" + mc + "','" + xk + "','" + bz + "','" + path + "/" + file.getFileName() + "','" + username + "','" + dw + "','" + date2 + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "�����ɹ���");
                    request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "����ʧ�ܣ�");
                    request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                }
            } else if (method.equals("upcg")) {       //�޸�˽�̿γ�
                String id = mySmartUpload.getRequest().getParameter("id");
                String username = (String) session.getAttribute("user");
                String dw = cb.getString("select address from admin where username='" + username + "'");
                String bh = mySmartUpload.getRequest().getParameter("bh");
                String mc = mySmartUpload.getRequest().getParameter("mc");
                String xk = mySmartUpload.getRequest().getParameter("xk");
                String bz = mySmartUpload.getRequest().getParameter("bz");
                SmartFile file = mySmartUpload.getFiles().getFile(0);
                String path = "upfile";
                count = mySmartUpload.save(path);
                if (count == 0) {
                    int flag = cb.comUp("update cg set bh='" + bh + "',mc='" + mc + "',xk='" + xk + "',bz='" + bz + "'," +
                            "yh='" + username + "',dw='" + dw + "',sj='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "�����ɹ���");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "����ʧ�ܣ�");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    }
                } else {
                    int flag = cb.comUp("update cg set bh='" + bh + "',mc='" + mc + "',xk='" + xk + "',bz='" + bz + "'," +
                            "url='" + path + "/" + file.getFileName() + "',yh='" + username + "',dw='" + dw + "',sj='" + date2 + "' where id='" + id + "'");
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "�����ɹ���");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "����ʧ�ܣ�");
                        request.getRequestDispatcher("admin/coach/manage_member.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
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
