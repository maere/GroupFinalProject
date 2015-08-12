/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.dto;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author apprentice
 */
public class Post {
    private int postId;
    private String postTitle;
    private Date createdDate;
    private Date uploadDate;
    private Date takeDownDate;
    private String content;

    private List<Integer> hashTagIds;
    private List<Integer> commentIds;

    private int userIdCreatedBy;
    private int userIdUpdatedBy;        

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 13 * hash + this.postId;
        hash = 13 * hash + Objects.hashCode(this.postTitle);
        hash = 13 * hash + Objects.hashCode(this.createdDate);
        hash = 13 * hash + Objects.hashCode(this.uploadDate);
        hash = 13 * hash + Objects.hashCode(this.takeDownDate);
        hash = 13 * hash + Objects.hashCode(this.content);
        hash = 13 * hash + Objects.hashCode(this.hashTagIds);
        hash = 13 * hash + Objects.hashCode(this.commentIds);
        hash = 13 * hash + this.userIdCreatedBy;
        hash = 13 * hash + this.userIdUpdatedBy;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Post other = (Post) obj;
        if (this.postId != other.postId) {
            return false;
        }
        if (!Objects.equals(this.postTitle, other.postTitle)) {
            return false;
        }
        if (!Objects.equals(this.createdDate, other.createdDate)) {
            return false;
        }
        if (!Objects.equals(this.uploadDate, other.uploadDate)) {
            return false;
        }
        if (!Objects.equals(this.takeDownDate, other.takeDownDate)) {
            return false;
        }
        if (!Objects.equals(this.content, other.content)) {
            return false;
        }
        if (!Objects.equals(this.hashTagIds, other.hashTagIds)) {
            return false;
        }
        if (!Objects.equals(this.commentIds, other.commentIds)) {
            return false;
        }
        if (this.userIdCreatedBy != other.userIdCreatedBy) {
            return false;
        }
        if (this.userIdUpdatedBy != other.userIdUpdatedBy) {
            return false;
        }
        return true;
    }


    
    
    

	public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Date getTakeDownDate() {
        return takeDownDate;
    }

    public void setTakeDownDate(Date takeDownDate) {
        this.takeDownDate = takeDownDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Integer> getHashTagIds() {
        return hashTagIds;
    }

    public void setHashTagIds(List<Integer> hashTagIds) {
        this.hashTagIds = hashTagIds;
    }

    public List<Integer> getComments() {
        return commentIds;
    }

    public void setComments(List<Integer> commentIds) {
        this.commentIds = commentIds;
    }

    public int getUserIdCreatedBy() {
        return userIdCreatedBy;
    }

    public void setUserIdCreatedBy(int userIdCreatedBy) {
        this.userIdCreatedBy = userIdCreatedBy;
    }

    public int getUserIdUpdatedBy() {
        return userIdUpdatedBy;
    }

    public void setUserIdUpdatedBy(int userIdUpdatedBy) {
        this.userIdUpdatedBy = userIdUpdatedBy;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public List<Integer> getCommentIds() {
        return commentIds;
    }

    public void setCommentIds(List<Integer> commentIds) {
        this.commentIds = commentIds;
    }
    
    
    
    
}
