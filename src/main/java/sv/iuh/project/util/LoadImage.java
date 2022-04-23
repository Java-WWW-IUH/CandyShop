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
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.URIDereferencer;

@WebServlet(urlPatterns = "/image/*")
public class LoadImage extends HttpServlet {
    private String imagePath;


    @Override
    public void init() throws ServletException {
        imagePath=System.getProperty("catalina.home")+File.separator+"assets/user/imgproduct";
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestImage=request.getPathInfo();
        if(requestImage==null){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
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
        try {
                    Files.copy(image.toPath(), response.getOutputStream());
        } catch (Exception e) {
            System.out.println("");
        }
        
    }

}
