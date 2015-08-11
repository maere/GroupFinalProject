/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.dto;

import java.util.Date;
import java.util.List;

/**
 *
 * @author apprentice
 */
public class Post {
    private int postId;
    private Date createdDate;
    private Date uploadDate;
    private Date takeDownDate;
    private String content;
    private List<Integer> hashTagIds;
    private List<Integer> commentIds;

    
    
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentIds == null) ? 0 : commentIds.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + ((hashTagIds == null) ? 0 : hashTagIds.hashCode());
		result = prime * result + postId;
		result = prime * result + ((takeDownDate == null) ? 0 : takeDownDate.hashCode());
		result = prime * result + ((uploadDate == null) ? 0 : uploadDate.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Post other = (Post) obj;
		if (commentIds == null) {
			if (other.commentIds != null) {
				return false;
			}
		} else if (!commentIds.equals(other.commentIds)) {
			return false;
		}
		if (content == null) {
			if (other.content != null) {
				return false;
			}
		} else if (!content.equals(other.content)) {
			return false;
		}
		if (createdDate == null) {
			if (other.createdDate != null) {
				return false;
			}
		} else if (!createdDate.equals(other.createdDate)) {
			return false;
		}
		if (hashTagIds == null) {
			if (other.hashTagIds != null) {
				return false;
			}
		} else if (!hashTagIds.equals(other.hashTagIds)) {
			return false;
		}
		if (postId != other.postId) {
			return false;
		}
		if (takeDownDate == null) {
			if (other.takeDownDate != null) {
				return false;
			}
		} else if (!takeDownDate.equals(other.takeDownDate)) {
			return false;
		}
		if (uploadDate == null) {
			if (other.uploadDate != null) {
				return false;
			}
		} else if (!uploadDate.equals(other.uploadDate)) {
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
    
}
