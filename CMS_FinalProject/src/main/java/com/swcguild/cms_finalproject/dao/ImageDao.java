package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.Image;

public interface ImageDao {

	public Image getImageById(int imageId);
	public void updateImage(int imageId);
	public List<Image> getAllImages();
	public void deleteImage(int imageId);
	
}
