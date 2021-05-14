import jwt from "jsonwebtoken";

import { users } from "../data/users.js";

const options = {
  algorithm: "RS512",
  expiresIn: "24h",
  issuer: "slacktracer",
};

const secretOrPrivateKey = process.env.PRIVATE_OR_SECRET_KEY;

export const makeAccessToken = ({ email }) => {
  const payload = { email };

  const userData = getUserData({ email });

  if (userData === undefined) {
    throw new Error("User not found.");
  }

  const { claims, namespace } = getHasuraClaims({ userData });

  payload[namespace] = claims;

  return jwt.sign(payload, secretOrPrivateKey, options);
};

const getHasuraClaims = ({ userData }) => {
  return {
    claims: {
      "x-hasura-allowed-roles": ["admin"],
      "x-hasura-default-role": "admin",
      "x-hasura-role": "admin",
      "x-hasura-contact-id": userData.contact_id,
    },
    namespace: "https://hasura.io/jwt/claims",
  };
};

const getUserData = ({ email }) => {
  const userData = users.find((user) => user.email === email);

  return userData;
};
