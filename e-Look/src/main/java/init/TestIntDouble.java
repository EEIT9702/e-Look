package init;

public class TestIntDouble {

	public static void main(String[] args) {
		Double discount = 1.0;
		Integer oPrice = 98;
		
		Integer price=null;
		System.out.println(discount * oPrice);
		price = (int) Math.round(discount * oPrice);
		
		System.out.println(price);

	}

}
