describe("the app", () => {
  it("loads without crashing", () => {
    cy.visit("http://localhost:1234");

    cy.getLabel("hello").should("be.visible");
  });
});
