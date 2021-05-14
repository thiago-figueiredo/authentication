import jwt from "jsonwebtoken";

const options = {
  algorithm: "RS512",
  expiresIn: "24h",
  issuer: "slacktracer",
};

const secretOrPrivateKey = process.env.PRIVATE_OR_SECRET_KEY;

export const makeAccessToken = ({ email }) => {
  const payload = { email };

  const { claims, namespace } = getHasuraClaims();

  payload[namespace] = claims;

  return jwt.sign(payload, secretOrPrivateKey, options);
};

const getHasuraClaims = () => {
  return {
    claims: {
      "x-hasura-allowed-roles": ["admin"],
      "x-hasura-default-role": "admin",
      "x-hasura-role": "admin",
    },
    namespace: "https://hasura.io/jwt/claims",
  };
};
