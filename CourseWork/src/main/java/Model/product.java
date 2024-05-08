package Model;

public class product {
	private int productId;
    private String productName;
    private double price;
    private int quantity;
    private String productImage;
    private String productDescription;
    
    public product(int productId, String productName, double price, int quantity, String productDescription, String productImage) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.productDescription = productDescription;
        this.productImage = productImage;
    }
    
    public product(String productName, double price, int quantity) {

        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }
    
    public product(int productId, String productName, double price, int stockQuantity) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.quantity = stockQuantity;
	}
	
    public product() {
    	
    }
    
    
    public int getProductId()
    {
        return productId;
    }
    public void setProductId(int productId)
    {
        this.productId = productId;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
}
