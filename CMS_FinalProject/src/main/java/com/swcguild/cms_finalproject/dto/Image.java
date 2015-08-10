/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.dto;


import com.mysql.jdbc.Blob;

/**
 *
 * @author apprentice
 */
public class Image {
    private int imageId;
    private String name;
    private java.sql.Blob image;
    private String imageType;

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public java.sql.Blob getImage() {
        return image;
    }

    public void setImage(java.sql.Blob blob) {
        this.image = blob;
    }

    public String getImageType() {
        return imageType;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }
}
