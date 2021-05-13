import jwt from "jsonwebtoken";

const options = {
  algorithm: "RS512",
  expiresIn: 5 * 60,
  issuer: "slacktracer",
};

const secretOrPrivateKey = process.env.PRIVATE_OR_SECRET_KEY;

export const makeAccessToken = ({ email }) => {
  const payload = { email };

  return jwt.sign(payload, secretOrPrivateKey, options);
};

//     'https://hasura.io/jwt/claims': {
//       'x-hasura-allowed-roles': ['user', 'nouser'],
//       'x-hasura-default-role': 'user',
//       'x-hasura-role': 'user',
//       'x-hasura-user-id': '1234567890',
//       'x-hasura-org-id': '123',
//       'x-hasura-custom': 'custom-value',
//     },
