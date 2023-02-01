describe('product details page', () => {
  beforeEach(() => {

    cy.visit('/');
  });


  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('Adds the product to the cart', () => {
    cy.get('[alt="Scented Blade"]').click();
    cy.get(".button_to").click();
    cy.contains(".nav-link", "My Cart (1)").should("be.visible");


  });

});