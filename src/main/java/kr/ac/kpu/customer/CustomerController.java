package kr.ac.kpu.customer;

import com.google.gson.Gson;
import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.entity.CustomerSearchVM;
import kr.ac.kpu.entity.ProjectSearchVM;
import kr.ac.kpu.project.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @Autowired
    ProjectService projectService;

    @GetMapping("/manageCustomer")
    public String getActivityList(Model model) throws Exception {
        model.addAttribute("customerList", new Gson().toJson(customerService.getCustomerList()));
        model.addAttribute("pageLink", "/manage/manageCustomer.jsp");

        return "/layout/grid_layout";
    }

    @GetMapping("/searchCustomer")
    @ResponseBody
    public List<BusinessCustomer> searchCustomerList(@ModelAttribute CustomerSearchVM searchCondition, Model model) throws Exception {
        return customerService.searchCustomerList(searchCondition);
    }

    @GetMapping("/detailCustomer")
    public String addProject(@RequestParam(required = false) String customerId, Model model) throws Exception {
        model.addAttribute("customerList", new Gson().toJson(customerService.getCustomerYList()));
        model.addAttribute("pageLink", "/detail/detailCustomer.jsp");
        model.addAttribute("customer", (null != customerId)? new Gson().toJson(customerService.getCustomer(customerId)) : "[]");
        model.addAttribute("haveObj", (null != customerId)? true : false);

        return "/layout/grid_layout";
    }

    @PostMapping("/detailCustomer")
    public String addProject(BusinessCustomer businessCustomer) throws Exception {
        customerService.editCustomer(businessCustomer);
        return "redirect:/manageCustomer";
    }
}
