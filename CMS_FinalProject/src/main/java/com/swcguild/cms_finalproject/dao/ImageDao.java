package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.Image;

public interface ImageDao {

	public Image addImage(Image image);
	public Image getImageById(int imageId);
	//public void updateImage(Image image);
	//public List<Image> getAllImages();
	//public void deleteImage(int imageId);
	
}
