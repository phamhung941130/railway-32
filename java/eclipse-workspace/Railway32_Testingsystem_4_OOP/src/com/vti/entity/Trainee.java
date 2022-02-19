package com.vti.entity;

public class Trainee extends Account implements ITraineeDoing {
	private String unnivercity;

	public Trainee(int id, String email, String username, String fullname, String unnivercity) {
		super(id, email, username, fullname);
		// TODO Auto-generated constructor stub
		this.unnivercity = unnivercity;

	}

	public String getUnnivercity() {
		return unnivercity;
	}

	public void setUnnivercity(String unnivercity) {
		this.unnivercity = unnivercity;
	}

	@Override
	public String toString() {
		return "ID: " + super.getId() + "Email: " + super.getEmail() + "Username: " + super.getUsername() + "Fullname"
				+ super.getFullname() + "unnivercity=" + this.unnivercity;
	}

	@Override
	public void goVTI() {
		System.out.println("di den vti");
	}

	@Override
	public void doHomework() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doRollup() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doLearning() {
		// TODO Auto-generated method stub

	}

}
