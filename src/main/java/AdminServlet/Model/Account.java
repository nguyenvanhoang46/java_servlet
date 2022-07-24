package AdminServlet.Model;

public class Account {
	private int id;
    private String user;
    private String pass;
    private String email;
    private int isSell;
    private int isAdmin;

    public Account() {
    }

	public Account(String user, String pass, String email, int Sell,  int isAdmin) {
		super();
		this.user = user;
		this.pass = pass;
		this.email = email;
		this.isSell=isAdmin; 
		this.isAdmin = isAdmin;
	}

	public Account(int id, String user, String pass, String email,int Sell,   int isAdmin) {
		super();
		this.id = id;
		this.user = user;
		this.pass = pass;
		this.email = email;
		this.isSell=isAdmin; 
		this.isAdmin = isAdmin;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	} 

	public int getIsSell() {
		return isSell;
	}

	public void setIsSell(int isSell) {
		this.isSell = isSell;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

    

     
     

    
}
