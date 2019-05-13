package util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Panel;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class ImageResize{

        public static void resize(File file){
                try{
                        BufferedImage i = ImageIO.read(file); //변형하고자 하는 이미지
                        Image img = i.getScaledInstance(500,500,Image.SCALE_DEFAULT ); //사이즈 변경
   
                        BufferedImage oi = new BufferedImage(500,500,BufferedImage.TYPE_INT_RGB ); //저장할 이미지 객체 생성
                        ImageIO.write(oi,"jpg",new File("2.jpg")); //새로운 이미지로 저장,jpg형식
                }catch(Exception e){
                        System.out.println(e);
                }
        }
}