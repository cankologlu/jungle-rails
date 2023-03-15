describe('jungle to open', () => { 
  beforeEach(() => {
    cy.visit('/')
  });
  

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should click on the first product element", () => {
    cy.get(".products article a" )
    .contains("Scented Blade")
    .click({force: true});

    cy.get("section.products-show article.product-detail h1")
    .should("include.text", "Scented Blade")
  })

})