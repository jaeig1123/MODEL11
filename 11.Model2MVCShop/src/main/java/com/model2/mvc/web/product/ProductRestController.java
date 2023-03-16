package com.model2.mvc.web.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo ) throws Exception{
		
		System.out.println("/product/json/getProduct : GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
	}

	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product insertProduct(		@RequestBody Product product) throws Exception{
		
		productService.insertProduct(product);
		
		System.out.println("/product/json/addProduct : POST");
		//Business Logic
		System.out.println("::"+product);
		
		return product;		
	}
	
	@RequestMapping( value="json/updateProduct/{prodNo}", method=RequestMethod.GET)
	public Product updateProduct(@PathVariable int prodNo) throws Exception{
		
		System.out.println("/product/json/updateProduct :: GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="json/updateProduct",method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception{
		
		productService.updateProduct(product);
		
		System.out.println("/product/json/updateProduct :: POST");
		System.out.println("product :: "+product);
		
		return product;
	}
	
	@RequestMapping( value="json/listProduct")
	public void listProduct(@RequestBody Search search) throws Exception{
		
		Product product = new Product();
		Map<String,Object> map = productService.getProductList(search);
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println("/product/json/listProduct :: GET/POST");
		System.out.println("product :: ");
		
		Integer totalCount = (Integer)map.get("totalCount");
		
	}
}