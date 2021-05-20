const hasuraAllowedRoles = ["admin", "user"];

const [, hasuraDefaultRole] = hasuraAllowedRoles;

export const getHasuraClaims = ({ contactData: { id, role } }) => {
  const hasuraRole = role || hasuraDefaultRole;

  return {
    claims: {
      "x-hasura-allowed-roles": hasuraAllowedRoles,
      "x-hasura-contact-id": id,
      "x-hasura-default-role": hasuraDefaultRole,
      "x-hasura-role": hasuraRole,
    },
    namespace: "https://hasura.io/jwt/claims",
  };
};
