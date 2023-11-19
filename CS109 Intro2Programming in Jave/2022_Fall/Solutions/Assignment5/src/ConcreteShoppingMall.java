import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ConcreteShoppingMall implements ShoppingMall {
    private List<Member> members = new ArrayList<>();
    private List<Order> orders = new ArrayList<>();
    private double totalincome;
    @Override
    public void addMember(String info) {
        String temp[] = info.split(" ");
        if(temp[3].equals("G")) {
            members.add(new GoldCardMember(info));
        } else if (temp[3].equals("S")) {
            members.add(new SilverCardMember(info));
        }
    }

    @Override
    public void addMember(List<String> infos) {
        for(String info : infos) {
            String temp = info.split(" ")[3];
            if(temp.equals("G")) {
                members.add(new GoldCardMember(info));
            } else if (temp.equals("S")) {
                members.add(new SilverCardMember(info));
            }
        }
    }

    @Override
    public Member getMember(String memberId) {
        for(Member i : this.members) {
            if(i.getMemberId().equals(memberId)) {
                return i;
            }
        }
        return null;
    }

    @Override
    public double placeOrder(String memberId, int cost, ProductCategory category) {
        Member buyer = getMember(memberId);
        double actualcost = buyer.consume(cost);
        this.orders.add(new Order(buyer, actualcost, cost, category));
        totalincome += actualcost;
        return actualcost;
    }

    @Override
    public List<String> getMemberRecords(String memberId) {
        List<String> result = new ArrayList<>();
        for(Order i : this.orders) {
            if(i.getBuyer().getMemberId().equals(memberId)) {
                result.add(i.toString());
            }
        }
        return result;
    }

    @Override
    public List<String> getCostByCategory() {
        int num[] = new int[10];
        double cost[] = new double[10];
        List<String> result = new ArrayList<>();
        ProductCategory cats[] = ProductCategory.values();
        for(Order i : orders) {
            int index = i.getCat().ordinal();
            num[index]++; cost[index] += i.getActualcost();
        }
        for(int j = 0; j < 7; j++) {
            result.add(String.format("%s %d %.0f", cats[j], num[j], cost[j]));
        }
        return result;
    }

    @Override
    public List<String> getMemberRecordByGenderAndAge(char gender, int lowerAge, int upperAge) {
        List<String> result = new ArrayList<>();
        List<Member> sorted_members = new ArrayList<>();
        for(Order o : orders) {
            Member i = o.getBuyer();
            int age = i.getAge();
            if(sorted_members.contains(i)) continue;
            if(i.getGender()==gender && age >= lowerAge && age <= upperAge){
                sorted_members.add(i);
            }
        }
        Collections.sort(sorted_members);
        for(Member i : sorted_members) {
            result.add(String.format("%s %s %d %.1f", i.getMemberId(), gender, i.getAge(), i.getTotalCost()));
        }
        return result;
    }

    @Override
    public double getTotalCost(String memberId) {
        return getMember(memberId).getTotalCost();
    }

    @Override
    public double getTotalIncome() {
        return this.totalincome;
    }
}
