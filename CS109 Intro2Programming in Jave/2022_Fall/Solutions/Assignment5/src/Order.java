public class Order {
    private ProductCategory cat;
    private double price;
    private double actualcost;
    private Member buyer;
    public Order(Member buyer, double actualcost, double price, ProductCategory cat) {
        this.buyer = buyer;
        this.actualcost = actualcost;
        this.price = price;
        this.cat = cat;
    }

    public Member getBuyer() {
        return this.buyer;
    }

    public ProductCategory getCat() {
        return this.cat;
    }

    public double getActualcost() {
        return this.actualcost;
    }

    public String toString() {
        return String.format("%s %s %.0f %.0f", this.buyer.getMemberId(), this.cat, this.price, this.actualcost);
    }
}
