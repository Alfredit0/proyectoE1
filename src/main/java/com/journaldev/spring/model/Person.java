package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="PERSON")
public class Person {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty(message="Es necesario escribir el nombre.")
	private String name;
	
	@NotEmpty(message="Es necesario escribir la dirección.")
	private String country;
	
	@Length(max=10,min=10,message="El número de teléfono es invalido. Debe de tener 10 dígitos.")
	@NotEmpty(message="El necesario escribir el teléfono.") 
	@NumberFormat(style= Style.NUMBER)
	private String telefono;
	
	@NotEmpty(message="Es necesario escribir el correo electrónico.")
	@Email(message="Escriba una dirección de correo electrónico valida.")
	private String email;
	
	@NotEmpty(message="Es necesario escribir la fecha de nacimiento.")
	private String borndate;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	public void setTelefono(String telefono){
		this.telefono=telefono;
	}		
	
	public String getTelefono(){
		return telefono;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setBorndate(String borndate){
		this.borndate=borndate;
	}
	
	public String getBorndate(){
		return this.borndate;  
	}	
	
	@Override
	public String toString(){
		return "id="+id+", name="+name+", country="+country+", telefono="+ telefono;
	}
}
