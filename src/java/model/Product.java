/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Product {
    int productId;
    String productName;
    int CategoryId;
    double price;
    int quantity;
    String image;
    String description;
    int sold_quantity;

    public Product() {
    }

    public Product(int productId, String productName, int CategoryId, double price, int quantity, String image, String description, int sold_quantity) {
        this.productId = productId;
        this.productName = productName;
        this.CategoryId = CategoryId;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.description = description;
        this.sold_quantity = sold_quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSold_quantity() {
        return sold_quantity;
    }

    public void setSold_quantity(int sold_quantity) {
        this.sold_quantity = sold_quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", CategoryId=" + CategoryId + ", price=" + price + ", quantity=" + quantity + ", image=" + image + ", description=" + description + ", sold_quantity=" + sold_quantity + '}';
    }

    
    
}
