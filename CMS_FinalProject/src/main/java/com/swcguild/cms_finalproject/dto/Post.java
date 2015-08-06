/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.dto;

import java.util.List;

/**
 *
 * @author apprentice
 */
public class Post {
    private int postId;
    private int createdDate;
    private int uploadDate;
    private int takeDownDate;
    private String content;
    private List<String> hashTags;
    private List<String> comments;

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(int createdDate) {
        this.createdDate = createdDate;
    }

    public int getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(int uploadDate) {
        this.uploadDate = uploadDate;
    }

    public int getTakeDownDate() {
        return takeDownDate;
    }

    public void setTakeDownDate(int takeDownDate) {
        this.takeDownDate = takeDownDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<String> getHashTags() {
        return hashTags;
    }

    public void setHashTags(List<String> hashTags) {
        this.hashTags = hashTags;
    }

    public List<String> getComments() {
        return comments;
    }

    public void setComments(List<String> comments) {
        this.comments = comments;
    }
    
}
