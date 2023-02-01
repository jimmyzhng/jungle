describe('product details page', () => {
  beforeEach(() => {

    cy.visit('/');
  });


  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('Navigates to a product detail page when clicking on a product', () => {
    cy.get('[alt="Scented Blade"]').click();
    cy.get('.main-img').should('be.visible');
    cy.get('.quantity').should('be.visible');
    cy.get('.price').should('be.visible');
  });

});