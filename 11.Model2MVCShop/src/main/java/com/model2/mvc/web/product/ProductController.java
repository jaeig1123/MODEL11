package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현하지 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/addProduct.do : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	//AddProductAction
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String insertProduct( @ModelAttribute("product") Product product ) throws Exception {
		
		System.out.println("/insertProduct.do : POST");
		//Business Logic
		productService.insertProduct(product);
		
		
		
		return "forward:/product/productView.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		
		System.out.println("/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		System.out.println("product : " +product.getRegDate());
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		//productService.updateProduct(product);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		System.out.println("update product 값 확인 : "+product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		System.out.println("updateProduct : POST");
		System.out.println("Product 값 체크.. : " +product);
		productService.updateProduct(product);
		
		model.addAttribute("product", product);
		
		System.out.println("Product 값 체크..2 : " +product);
		
		
		System.out.println("updateProduct : POST product 값 : "+product+" prodNo : "+product.getProdNo());
		
		return "forward:/product/getProduct.jsp";
	}
	
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct : GET / POST");
		
		
		String menu = request.getParameter("menu");
		String id = request.getParameter("id");
		System.out.println("id값 확인..! "+id);
		System.out.println("ListProductAction menu = " + menu);
		
		request.setAttribute("menu", menu);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		

		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListProduct.do :: "+resultPage);
		System.out.println("i 값 테스트 : "+ (search.getCurrentPage()-1));
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("listCheck", (search.getCurrentPage()-1));
		
		return "forward:/product/listProduct.jsp";
	}
	
}