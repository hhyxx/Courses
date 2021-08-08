package chapter07;

public class ProductBean {
	private float price;
	private int num;
	

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public float getPrice() { 
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public double getTotalPrice() {
		return this.price * this.num;
	}
	
}
