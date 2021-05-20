import jwt from "jsonwebtoken";

import { getContactData } from "./get-contact-data.js";
import { getHasuraClaims } from "./get-hasura-claims.js";

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
