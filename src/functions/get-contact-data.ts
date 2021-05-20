import { contactData, contacts } from "../data/contacts.js";

export const getContactData = ({ email }): contactData => {
  const contactData = contacts.find((contact) => contact.email === email);

  return contactData;
};
