package com.sunway.cbm.util;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AppConfig {
	
	private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);

	private static AppConfig appConfig;

	public static AppConfig getInstance() {
		return appConfig;
	}

	private AppConfig() {
		super();
		appConfig = this;
		// TODO Auto-generated constructor stub
	}

	public Map<Integer, String> MAP_UPLOAD_ROUTE = new HashMap<Integer, String>();

	private String uploadOrgPicRoute;
	private String uploadCouPicRoute;
	private String uploadCatPicRoute;
	private String uploadComOrgPicRoute;
	private String uploadComCouPicRoute;
	private String uploadAPKRoute;

	private String adminId;
	private String adminNickname;
	private String adminPassword;
	private String adminAccount;

	public String getAdminNickname() {
		return adminNickname;
	}

	public void setAdminNickname(String adminNickname) {
		this.adminNickname = adminNickname;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminAccount() {
		return adminAccount;
	}

	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}

	public String getUploadAPKRoute() {
		return uploadAPKRoute;
	}

	public void setUploadAPKRoute(String uploadAPKRoute) {
		this.uploadAPKRoute = uploadAPKRoute;
		MAP_UPLOAD_ROUTE.put(Constants.UPLOAD_APK_TYPE, uploadAPKRoute);
	}

	public String getUploadOrgPicRoute() {
		return uploadOrgPicRoute;
	}

	public void setUploadOrgPicRoute(String uploadOrgPicRoute) {
		this.uploadOrgPicRoute = uploadOrgPicRoute;
		MAP_UPLOAD_ROUTE.put(Constants.UPLOAD_ORG_PIC_TYPE, uploadOrgPicRoute);
	}

	public String getUploadCouPicRoute() {
		return uploadCouPicRoute;
	}

	public void setUploadCouPicRoute(String uploadCouPicRoute) {
		this.uploadCouPicRoute = uploadCouPicRoute;
		MAP_UPLOAD_ROUTE.put(Constants.UPLOAD_COU_PIC_TYPE, uploadCouPicRoute);
	}

	public String getUploadCatPicRoute() {
		return uploadCatPicRoute;
	}

	public void setUploadCatPicRoute(String uploadCatPicRoute) {
		this.uploadCatPicRoute = uploadCatPicRoute;
		MAP_UPLOAD_ROUTE.put(Constants.UPLOAD_CAT_PIC_TYPE, uploadCatPicRoute);
	}

	public String getUploadComOrgPicRoute() {
		return uploadComOrgPicRoute;
	}

	public void setUploadComOrgPicRoute(String uploadComOrgPicRoute) {
		this.uploadComOrgPicRoute = uploadComOrgPicRoute;
		MAP_UPLOAD_ROUTE.put(Constants.UPLOAD_COM_ORG_PIC_TYPE, uploadComOrgPicRoute);
	}

	public String getUploadComCouPicRoute() {
		return uploadComCouPicRoute;
	}

	public void setUploadComCouPicRoute(String uploadComCouPicRoute) {
		this.uploadComCouPicRoute = uploadComCouPicRoute;
		MAP_UPLOAD_ROUTE.put(Constants.UPLOAD_COM_COU_PIC_TYPE, uploadComCouPicRoute);
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

}
