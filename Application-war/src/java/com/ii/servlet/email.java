/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ii.servlet;

import com.ii.ejb.mailSender;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iza
 */
@WebServlet(name = "email", urlPatterns = {"/email"})
public class email extends HttpServlet {

    @EJB
    private mailSender mailSend;
    
     
   
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    
         String zawartosc = request.getParameter("zawartosc");
         String email = request.getParameter("email");
         
         //
         
         String fromEmail = "writeit@onet.pl";
         String username = "writeit@onet.pl";
         String password = "Writeitapp1";
         String subjet = "Przypomnienie";
         
        
        
        
        try (PrintWriter out = response.getWriter()) {
           
          mailSend.sendEmail(fromEmail, username, password, email, subjet, zawartosc);
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet email</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Mail sent <a href='strona.html'>ff</a></h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
