package com.aia.main.weatherapi.domain;

import java.util.List;

public class ResponseDataItems {

	List<ResponseDataItem> item;

	public List<ResponseDataItem> getItem() {
		return item;
	}

	public void setItem(List<ResponseDataItem> item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "ResponseDataItems [item=" + item + "]";
	}

}
