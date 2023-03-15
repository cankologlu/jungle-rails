describe('jungle to open', () => { 
  beforeEach(() => {



    cy.visit('/')
  });
  

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  // it("There is products on the page", () => {
  // cy.get(".products article").should("be.visible");
  // });


})
