package test;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.util.Date;

import javax.swing.ImageIcon;

// import com.sun.image.codec.jpeg.JPEGCodec;
// import com.sun.image.codec.jpeg.JPEGEncodeParam;
// import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class TestProducePic {

	public static void main(String[] a) {

		TestProducePic.createStringMark("/Volumes/Transcend/frm/frm_pic.jpg", "张哈三分","九阴白骨爪课程","no123232033.",new Date(),"/Volumes/Transcend/frm/frm_pic_1.jpg");
		
	}

	/**
	 * @param filePath
	 *            源图片路径
	 * @param markContent
	 *            图片中添加内容
	 * @param outPath
	 *            输出图片路径 字体颜色等在函数内部实现的
	 */
	// 给jpg添加文字
	public static boolean createStringMark(String filePath, String markContent, String cName,String number,Date endTime, String outPath) {
		ImageIcon imgIcon = new ImageIcon(filePath);
		Image theImg = imgIcon.getImage();
		int width = theImg.getWidth(null) == -1 ? 200 : theImg.getWidth(null);
		int height = theImg.getHeight(null) == -1 ? 200 : theImg.getHeight(null);
		System.out.println(width);
		System.out.println(height);
		System.out.println("width/2=" + width / 2);
		System.out.println("height/2=" + height / 2);
		System.out.println(theImg);
		BufferedImage bimage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bimage.createGraphics();

		Color mycolor = Color.black;
		g.setColor(mycolor);
		g.setBackground(Color.black);
		g.drawImage(theImg, 0, 0, null);
		g.setFont(new Font("宋体", Font.BOLD, 25)); // 字体、字型、字号
//		g.drawString(markContent, 580, 360); // 画文字		//内容，水平，垂直
		
		//每一个字符，逐一绘制
		//学员姓名
		for(int i = 0; i < markContent.length(); i++) {
			char c = markContent.charAt(i);
			g.drawString(c+"", 580 + i*27, 365);
		}
		
		//课程名称
		for(int i = 0; i < cName.length(); i++) {
			char c = cName.charAt(i);
			g.drawString(c+"", 520 + i*27, 430);
			//todo ,设置课程名最长， 打印的时候再分为两种情况
		}
		
		g.dispose();
		try {
			FileOutputStream out = new FileOutputStream(outPath); // 先用一个特定的输出文件名
			// JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			// JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bimage);
			// param.setQuality(100, true); //
			// encoder.encode(bimage, param);
			out.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}
