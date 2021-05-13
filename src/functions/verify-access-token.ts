import jwt from "jsonwebtoken";

const publicKey = process.env.PUBLIC_KEY;

export const verifyAccessToken = ({ token }) => {
  return new Promise((resolve, reject) => {
    jwt.verify(token, publicKey, (error, decoded) => {
      if (error) {
        reject(error);

        return;
      }

      resolve(decoded);
    });
  });
};
