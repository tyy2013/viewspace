package com.smart.cons;

/**
 *整个应用通用的常量 
 *<br><b>类描述:</b>
 *<pre>|</pre>
 *@see
 *@since
 */
public interface CommonConstant
{
   /**
    * 用户对象放到Session中的键名称
    */
   public static final String USER_CONTEXT = "USER_CONTEXT";
   
   /**
    * 将登录前的URL放到Session中的键名称
    */
   public static final String LOGIN_TO_URL = "toUrl";
   
   /**
    * 每页的记录数
    */
   public static final int PAGE_SIZE = 3;
   
   /**
    * 上传照片文件目录
    */
   public static final String UPLOAD_IMG_DIR = "/uploadimg/";
   
   /**
    * 上传文件目录
    */
   public static final String UPLOAD_DIR = "/uploads/";
   
   
}
