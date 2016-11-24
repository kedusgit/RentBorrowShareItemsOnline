package edu.mum.cs544.Domain;

/**
 * @author KEDUS BEKELE
 *
 */
import javax.persistence.Embeddable;
import javax.validation.constraints.Size;

@Embeddable
public class Address {

	private String street;
	private String city;
	private String state;
	@Size(max = 5, message = "zip code should be max 5 digit")
	private String zip;
	private String country;
	private String phoneNo;

	/* constructor definition */

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	/* getters and setters */
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
}
