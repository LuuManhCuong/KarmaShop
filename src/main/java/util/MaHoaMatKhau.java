package util;

import java.security.MessageDigest;
import java.util.Base64;

public class MaHoaMatKhau {
// su dung sha-1
	
	public static String toSHA1(String str) {
//		lam cho mat khau phuc tap
		String salt = "aJoi#sjr$@lk/.mcoeTwj@tjle;oxqskjhdjksjf1jurVn";
		String result = null;
		
		str = str + salt;
		
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.getEncoder().encodeToString(md.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
//	public static void main(String[] args) {
//		System.out.println(toSHA1("casa"));
//	}
}
