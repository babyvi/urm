package com.panly.urm.manager.right.vo;

import com.panly.urm.manager.right.entity.UrmRightValueSetConfig;

public class RightValueSetConfigSelect2 extends UrmRightValueSetConfig{
	
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String text;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
