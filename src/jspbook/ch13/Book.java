package jspbook.ch13;

public class Book {
	private String title, author, publisher;
	private int price;
	
	public Book(String t, String a, String p, int pr) {
		title = t;
		author =a;
		publisher = p;
		price = pr;
	}

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getPublisher() {
		return publisher;
	}

	public int getPrice() {
		return price;
	}
}
