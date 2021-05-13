import express from "express";

import { makeAccessToken } from "./functions/make-access-token.js";
import { verifyAccessToken } from "./functions/verify-access-token.js";

const app = express();
const port = 3000;

app.get("/authenticate", (request, response) => {
  const { email } = request.query;

  const token = makeAccessToken({ email });

  response.send(token);
});

app.get("/protected-get-request", async (request, response) => {
  const { token } = request.query;

  try {
    const decoded = await verifyAccessToken({ token });

    response.send(decoded);
  } catch (error) {
    response.send(error);
  }
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
