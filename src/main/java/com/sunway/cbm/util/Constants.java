package com.sunway.cbm.util;

public class Constants {
	public static final String WEB_APP_URL = "http://cbm.tunnel.mobi/cbm";
	public static final String CURRENT_USER = "current_user";
	public static final String PUBLIC_REQUEST_PREFIX = "/public";

	public static final int UPLOAD_ORG_PIC_TYPE = 0x0001; // 机构图片
	public static final int UPLOAD_COU_PIC_TYPE = 0x0002; // 课程图片
	public static final int UPLOAD_CAT_PIC_TYPE = 0x0003; // 分类图片
	public static final int UPLOAD_COM_ORG_PIC_TYPE = 0x0004; // 机构评论图片
	public static final int UPLOAD_COM_COU_PIC_TYPE = 0x0005; // 课程评论图片
	public static final int UPLOAD_APK_TYPE = 0x0006;// 上传APK

	public static final int HOST_ORG_MAX_COUNT = 6;
	public static final int HOST_COURSE_MAX_COUNT = 1;

	public static final int USER_TYPE_SUPERAMDIN_V = 0;
	public static final int USER_TYPE_AMDIN_V = 1;
	public static final int USER_TYPE_ORG_V = 2;
	public static final int USER_TYPE_NORMAL_V = 3;

	public static enum Code {
		LOGIN_FAILD
	}

	public static enum UserType {
		SUPERADMIN(USER_TYPE_SUPERAMDIN_V), ADMIN(USER_TYPE_AMDIN_V), ORG(USER_TYPE_ORG_V), NORMAL(USER_TYPE_NORMAL_V);
		private final int value;

		UserType(int value) {
			this.value = value;
			// TODO Auto-generated constructor stub
		}

		public int getValue() {
			return value;
		}
	}

	public static enum MenuType {
		MANAGER(0), MEMBER(1);
		private final int value;

		MenuType(int value) {
			this.value = value;
			// TODO Auto-generated constructor stub
		}

		public int getVlaue() {
			return value;
		}

	}
}
