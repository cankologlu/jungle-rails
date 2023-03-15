describe('jungle to open', () => { 
  beforeEach(() => {
    cy.visit('/')
  });

  it("should sign in and add the selected item to cart", () => {
    cy.get(".products article a")
    .contains("Scented Blade")
    .closest("article")
    .find("button")
    .click({ force: true })
    
    cy.contains("My Cart (1)")
  }) 
})


// const email = "abc@abc.com"      LOGIN FEATURE
// const password = "abcde"
// cy.get("nav ul a")
// .contains("Login")
// .click()
// cy.get("main form input[type=text]").type(`${email}`)
// cy.get("main form input[type=password]").type(`${password}`)
// cy.get("main form input[type=submit]").click()

