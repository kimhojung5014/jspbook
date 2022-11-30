package jspbook.ch07;

import java.util.ArrayList;

public class AddrManager {
	ArrayList<AddrBean>addrlist = new ArrayList<AddrBean>();
	
	public void add(AddrBean ab) {
		addrlist.add(ab);
	}
	public ArrayList<AddrBean> getAddrList() {
		return addrlist;
	}
}
