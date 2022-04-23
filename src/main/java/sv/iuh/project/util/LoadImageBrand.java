/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thanh Hoai
 */
@WebServlet(urlPatterns = "/imgbrand/*")
public class LoadImageBrand extends HttpServlet {

   private String imagePath;
    @Override
    public void init() throws ServletException {
        imagePath=System.getProperty("catalina.home")+File.separator+"assets/user/imgbrand";
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String requestImage=request.getPathInfo();
        if(requestImage==null){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            System.err.println("eeeee");
            return;
        }
        File image=new File(imagePath,URLDecoder.decode(requestImage, "UTF-8"));
        if(!image.exists()){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            System.err.println("ddd");
            return;
        }
        String contentType =getServletContext().getMimeType(image.getName());
        response.reset();
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(image.length()));
        Files.copy(image.toPath(), response.getOutputStream());
    }
}
