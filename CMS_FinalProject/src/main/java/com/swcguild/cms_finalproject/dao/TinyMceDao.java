/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.dao;

import com.swcguild.cms_finalproject.dto.Image;
import com.swcguild.cms_finalproject.dto.Post;

/**
 *
 * @author apprentice
 */
public interface TinyMceDao {
    public Post addSomething(Post post);
    public String getSomething();
    public Image addImage(Image image);
    public Image getImage(int id);
    
    //do we also need an update, and a delete method in here
}
