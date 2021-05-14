import jwt from "jsonwebtoken";

import { contacts } from "../data/contacts.js";

const options = {
  algorithm: "RS512",
  expiresIn: "24h",
  issuer: "slacktracer",
};

const secretOrPrivateKey = process.env.PRIVATE_OR_SECRET_KEY;

export const makeAccessToken = ({ email }) => {
  const payload = { email };

  const contactData = getContactData({ email });

  if (contactData === undefined) {
    throw new Error("User not found.");
  }

  const { claims, namespace } = getHasuraClaims({ contactData });

  payload[namespace] = claims;

  return jwt.sign(payload, secretOrPrivateKey, options);
};

const getHasuraClaims = ({ contactData }) => {
  return {
    claims: {
      "x-hasura-allowed-roles": ["admin"],
      "x-hasura-contact-id": contactData.id,
      "x-hasura-default-role": "admin",
      "x-hasura-role": "admin",
    },
    namespace: "https://hasura.io/jwt/claims",
  };
};

const getContactData = ({ email }) => {
  const contactData = contacts.find((contact) => contact.email === email);

  return contactData;
};
