export type EmailAddressString = string & { __type: "EmailAddressString" };

export const isEmailAddressString = (
  str: string
): str is EmailAddressString => {
  const EMAIL_ADDRESS_REGEX =
    /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

  return EMAIL_ADDRESS_REGEX.test(str);
};
