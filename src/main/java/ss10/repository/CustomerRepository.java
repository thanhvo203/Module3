package ss10.repository;

import ss10.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=" +
                " rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"));
        customerList.add(new Customer(2,"Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://images.unsplash.com/photo-1517265035603-faefa167335b?ixlib=\n" +
                "    rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZXhwbG9yZSUyMHRoZSUyMHdvcmxkfGVufDB8fDB8fHww&w=1000&q=80"));
        customerList.add(new Customer(3,"Nguyễn Thái Hoà","1983-08-22","Nam Định","https://media.istockphoto.com/id/514319364/fr/photo/jadore-nature-et-la-photographie.\n" +
                "    jpg?s=170667a&w=0&k=20&c=u0PAfMWQaxbYt9vcVdbWkhYh8bggygJnuIytfK09ngk="));
        customerList.add(new Customer(4,"Trần Đăng Khoa","1983-08-17","Hà Tây","https://media.istockphoto.com/id/840223940/photo/looking-for-something-interesting.\n" +
                "    jpg?s=612x612&w=is&k=20&c=mgj-XBpJrojjT6zC473l0USq-hQMjWqiqqxbK9fUsNk="));
        customerList.add(new Customer(5,"Nguyễn Đình Thi","1983-08-19","Hà Nội","https://media.istockphoto.com/id/520945287/photo/break-for-breathtaking-views.\n" +
                "    jpg?s=612x612&w=is&k=20&c=hrNfPOuJs9ikMx2BoFu9pGL3hYzk5NVKQM1OJhqjnJI="));
    }

    @Override
    public List<Customer> display() {
        return customerList;
    }
}
