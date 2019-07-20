declare namespace Cypress {
  interface Chainable<Subject> {
    getLabel: (label: string) => Chainable<Subject>;
  }
}

Cypress.Commands.add("getLabel", (label: string) => {
  return cy.get(`[data-label='${label}']`);
});
