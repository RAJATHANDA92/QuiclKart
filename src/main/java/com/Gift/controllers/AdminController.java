package com.Gift.controllers;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.Gift.models.Category;
import com.Gift.models.HelpDesk;
import com.Gift.models.Order;
import com.Gift.models.OrderDetails;
import com.Gift.models.Product;
import com.Gift.service.AdminUserService;
import com.Gift.service.CategoryService;
import com.Gift.service.CustomerService;
import com.Gift.service.HelpDeskService;
import com.Gift.service.OrderDetailsService;
import com.Gift.service.OrderService;
import com.Gift.service.ProductService;

@Controller
public class AdminController {
	
	@Autowired
	private CategoryService catsrv;
	@Autowired private ProductService prodsrv;
	@Autowired private CustomerService custsrv;
	@Autowired private AdminUserService adminsrv;
	@Autowired private OrderService ordersrv;
	@Autowired private OrderDetailsService odsrv;
	@Autowired private HelpDeskService hdsrv;
	@Autowired private HttpSession session;

	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("totalusers", custsrv.allCustomers().size());
		model.addAttribute("totalproducts", prodsrv.allProducts().size());
		model.addAttribute("totalcategories", catsrv.totalCategories());
		model.addAttribute("totalorders", ordersrv.allOrders().size());
		return "dashboard";
	}
	
	@GetMapping("/users")
	public String customerlist(Model model){	
		model.addAttribute("users",custsrv.allCustomers());
		return "customers";
	}
	
	@GetMapping("/orders")
	public String orderslist(Model model){
		model.addAttribute("orders", ordersrv.allOrders());
		return "orders";
	}
	
	@GetMapping("/confirm/{id}")
	public String confirmOrder(@PathVariable("id") int orderid){
		ordersrv.confirmOrder(orderid);
		session.setAttribute("msg", "Order Confirmed successfully");
		return "redirect:/orders";
	}
	
	@GetMapping("/details/{id}")
	public String orderdetails(@PathVariable("id") int orderid, Model model){
		Order order=ordersrv.getOrderDetails(orderid);
		List<OrderDetails> odlist=odsrv.allItemsinOrder(orderid);
		System.out.println("Total items : "+odlist.size());
		model.addAttribute("cats", catsrv.getAllCategories());
		model.addAttribute("o", order);
		model.addAttribute("items",odlist);		
		model.addAttribute("cqty", odlist.size());
		return "orderdetails";
	}
	
	@GetMapping("/reports")
	public String report(Model model){
		model.addAttribute("items", prodsrv.listAbouttoExpireProducts());
		return "reports";
	}
	
	@GetMapping("/changepwd")
	public String changepassword(){		
		return "achangepwd";
	}
	
	@GetMapping("/tickets")
	public String helpdesk(Model model) {
		model.addAttribute("items", hdsrv.getAllRequest());
		return "tickets";
	}
	
	@PostMapping("/tickets")
	public String tickets(int id,String reply) {
		HelpDesk hd= hdsrv.findRequestById(id);
		hd.setReply(reply);
		hd.setStatus("Processed");
		hdsrv.saveRequest(hd);
		session.setAttribute("msg", "Reply saved successfully");
		return "redirect:/tickets";
	}
	
	@PostMapping("/changepwd")
	public String changepassword(String opwd,String pwd) {		
		if(adminsrv.updatePassword(opwd, pwd)) {
			session.setAttribute("msg", "Password updated successfully");
		}
		else {
			session.setAttribute("error", "Incorrect current password");
		}
		return "redirect:/changepwd";
	}
	
	@GetMapping("/products")
	public String products(Model model) {
		model.addAttribute("prods", prodsrv.allProducts());
		model.addAttribute("totalprods", prodsrv.allProducts().size());
		model.addAttribute("cats", catsrv.getAllCategories());
		return "products";
	}
	
	@GetMapping("/delprod/{id}")
	public String deleteproduct(@PathVariable("id") int id) {
		prodsrv.deleteProduct(id);
		session.setAttribute("msg", "Product deleted successfully");
		return "redirect:/products";
	}
	
	@PostMapping("/products")
	public String saveProduct(MultipartFile photo,Product p,String mfg,String expiry) {
		p.setMfgdate(LocalDate.parse(mfg+"-01"));
		p.setExpirydate(LocalDate.parse(expiry+"-01"));		

		Category cat=catsrv.findByCatId(p.getCatid());
		p.setCategory(cat);
		System.err.println(p);
		prodsrv.saveProduct(p, photo);
		session.setAttribute("msg", "Product saved successfully");
		return "redirect:/products";
	}
	
	@GetMapping(path = {"/categories","/categories/{id}"})
	public String categories(Model model,@PathVariable("id") Optional<Integer> id) {
		if(id.isPresent()) {
			Category cat=catsrv.findByCatId(id.get());
			model.addAttribute("catid",cat.getCatid());
			model.addAttribute("catname",cat.getCatname());
				
		}else {
			
			model.addAttribute("catid", catsrv.generateCatId());		
		}
		model.addAttribute("cats", catsrv.getAllCategories());		
		return "category";
	}	

	@PostMapping(path = {"/categories","/categories/{id}"})
	public String saveCategory(Category cat) {
		catsrv.saveCategory(cat);
		session.setAttribute("msg", "Category saved successfully");
		return "redirect:/categories";
	}
	
	@GetMapping("/logout")
	public String logout(){
		session.invalidate();
		return "redirect:/";
	}
}
