import java.util.List;

public interface ShoppingMall {

    public void addMember(String info);

    public void addMember(List<String> infos);

    public Member getMember(String memberId);

    public double placeOrder(String memberId, int cost, ProductCategory category);

    public List<String> getMemberRecords(String memberId);

    public List<String> getCostByCategory();

    public List<String> getMemberRecordByGenderAndAge(char gender, int lowerAge, int upperAge);

    public double getTotalCost(String memberId);

    public double getTotalIncome();
}
