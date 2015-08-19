/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.dto;

/**
 *
 * @author apprentice
 */
public class StaticPage {
    int staticPageId;
    String pageTitle;
    String pageContent;
    
	public int getStaticPageId() {
		return staticPageId;
	}
	public void setStaticPageId(int staticPageId) {
		this.staticPageId = staticPageId;
	}
	public String getPageTitle() {
		return pageTitle;
	}
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	public String getPageContent() {
		return pageContent;
	}
	public void setPageContent(String pageContent) {
		this.pageContent = pageContent;
	}
    
    
}
