package com.journaldev.spring;
import javax.validation.Valid;
import java.util.Map;
import org.springframework.validation.BindingResult;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.PersonService;

@Controller
public class PersonController {
	
	private PersonService personService;
	
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Persons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}
	
	@RequestMapping(value = "/alta", method = RequestMethod.GET)
	public String prueba(Locale locale, Model model) {
		model.addAttribute("person", new Person());	
		return "add";
	}
	
	@RequestMapping(value = "/deleteall", method = RequestMethod.GET)
	public String redirectDeleteAll(Locale locale, Model model) {		
		return "deleteall";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
    public String doLogin(@Valid @ModelAttribute("person") Person p,
            BindingResult result, Map<String, Object> model) {
 
        if (result.hasErrors()) {
        	if(p.getId() == 0){
            return "add";
        	}else{
        		return "update";
        	}
        }{
    		if(p.getId() == 0){
    			//new person, add it
    			this.personService.addPerson(p);
    		}else{
    			//existing person, call update
    			this.personService.updatePerson(p);
    		}
    		
    		return "redirect:/persons";
        }
    }
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}
	
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if(p.getId() == 0){
			//new person, add it
			this.personService.addPerson(p);
		}else{
			//existing person, call update
			this.personService.updatePerson(p);
		}
		
		return "redirect:/persons";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.personService.removePerson(id);
        return "redirect:/persons";
    }
	@RequestMapping("/removeall")
    public String removeAllPerson(){		
        this.personService.removeAllPerson();
        return "redirect:/persons";
    }
	
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        return "update";
    }
    
    @RequestMapping("/search")
    public String searchPerson(@RequestParam("name") String name, Model model){     
    	model.addAttribute("searchedName", name);
        model.addAttribute("listPersons2", this.personService.listPersons(name));
        return "person";
    }

    @RequestMapping("/resultados.htm")
    public String resultsPerson(@RequestParam("name") String name, Model model){         
    	model.addAttribute("searchedName", name);
        model.addAttribute("listPersons2", this.personService.listPersons(name));
        return "results";
    }
}
